import 'package:eventk/Features/Home/Presentation/Manager/get_events_state.dart';
import 'package:eventk/Features/Home/domain/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*Yara❤️*/
class GetEventsCubit extends Cubit<GetEventsState> {
  GetEventsCubit(this.homeRepo) : super(InitialGetEventsState());
  HomeRepo homeRepo;
  Future<void> GetEvents(String endPoint) async {
    emit(LoadingGetEventsState());
    var result = await homeRepo.requestForGetPopularEvents(endPoint);
    result.fold(
        (Failures) => emit(FailureGetEventsState(Failures.errorMessage)),
        (events) => emit(SuccessGetEventsState(events)));
  }
}
