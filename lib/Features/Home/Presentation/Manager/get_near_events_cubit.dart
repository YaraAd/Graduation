import 'package:eventk/Features/Home/Presentation/Manager/get_events_state.dart';
import 'package:eventk/Features/Home/domain/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*Yara❤️*/
class GetNearEventsCubit extends Cubit<GetEventsState> {
  GetNearEventsCubit(this.homeRepo) : super(InitialGetEventsState());
  HomeRepo homeRepo;
  Future<void> GetNearEvents(double latitude, double longitude) async {
    final result =
        await homeRepo.requestForGetEventsNearYou(latitude, longitude);
    result.fold(
        (Failures) => emit(FailureGetEventsState(Failures.errorMessage)),
        (EventsModel) => emit(SuccessGetEventsState(EventsModel)));
  }
}
