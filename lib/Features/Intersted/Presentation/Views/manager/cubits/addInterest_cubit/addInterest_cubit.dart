import 'package:eventk/Core/utils/addInterest_service.dart';
import 'package:eventk/Features/Intersted/Presentation/Views/manager/cubits/addInterest_cubit/addInterest_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddinterestCubit extends Cubit<AddinterestStates>{
  final AddinteretsService service;
  AddinterestCubit({required this.service}):super(AddInterestInitialState());
  Future<void>addInterest(int eventId)async{
    emit(AddInterestLoadingState());
    try{
      final result=await service.addInterest(eventID: eventId);
      emit(AddInterestSuccessState(result));
    }catch(e){
      emit(AddInterestErrorState(e.toString()));
    }
  }
}


