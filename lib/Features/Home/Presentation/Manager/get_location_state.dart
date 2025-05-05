import 'package:eventk/Features/Home/Data/model/locationModel.dart';

/*Yara❤️*/
abstract class GetLocationState {}

class InitialGetLocationState extends GetLocationState {}

class FailureGetLocationState extends GetLocationState {
  String errMessage;
  FailureGetLocationState(this.errMessage);
}

class SuccessGetLocationState extends GetLocationState {
  LocationModel locationModel;
  SuccessGetLocationState(this.locationModel);
}
