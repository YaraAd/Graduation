import 'package:dartz/dartz.dart';
import 'package:eventk/Core/errors/failures.dart';
import 'package:eventk/Features/Home/Data/model/categoriesModel.dart';
import 'package:eventk/Features/Home/Data/model/categoriesModelId.dart';
import 'package:eventk/Features/Home/Data/model/get_events_model/get_events_model.dart';
import 'package:eventk/Features/Home/Data/model/get_events_model/item.dart';
import 'package:eventk/Features/Home/Data/model/locationModel.dart';
import 'package:eventk/Features/Home/Data/model/organizationModel.dart';

/*Yara❤️*/
abstract class HomeRepo {
  Future<Either<Failures, List<CategoriesModel>>> requestForCategories();
  //Future<Either<Failures, CategoriesModelId>> reqestForCategoriesDetalies();
  Future<Either<Failures, List<OrganizationModel>>> requestForOrganization(
      bool? isFollowing);
  Future<Either<Failures, GetEventsModel>> requestForGetPopularEvents(
      String endPoint);
  Future<Either<Failures, GetEventsModel>> requestForGetEventsNearYou(
      double latitude, double longitude);
  Future<Either<Failures, GetEventsModel>> requestForGetUpcomingEvents(
      String endPoint);
}
