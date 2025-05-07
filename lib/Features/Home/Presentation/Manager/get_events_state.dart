import 'package:eventk/Features/Home/Data/model/get_events_model/get_events_model.dart';

abstract class GetEventsState {}

class InitialGetEventsState extends GetEventsState {}

class SuccessGetEventsState extends GetEventsState {
  GetEventsModel events;
  SuccessGetEventsState(this.events);
}

class LoadingGetEventsState extends GetEventsState {}

class FailureGetEventsState extends GetEventsState {
  String errMessage;
  FailureGetEventsState(this.errMessage);
}
