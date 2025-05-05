import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eventk/Core/errors/errorModel.dart';
import 'package:eventk/Core/errors/exceptions.dart';
import 'package:eventk/Core/errors/failures.dart';
import 'package:eventk/Core/utils/addInterest_service.dart';
import 'package:eventk/Core/utils/deleteInterest_service.dart';
import 'package:eventk/Core/utils/get_Interest_service.dart';
import 'package:eventk/Features/Intersted/Data/models/getInterest_model.dart';
import 'package:eventk/Features/Intersted/Domain/InterestedRepo.dart';
import 'package:eventk/helper/api.dart';

class InterestedrepoImpl implements Interestedrepo {
  @override
  Future<Either<Failures, List<EventsModel>>> getInterests() async {
    try {
      var getInterest =
          await GetInterestService(api: Api(dio: Dio())).getInterest();
      return right(getInterest);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ErrorModel>> addInterest(int eventId)async {
    try{
      var addInterest=await AddinteretsService(api: Api(dio: Dio())).addInterest(eventID: eventId);
      return Right(addInterest);
    }on CustomExceptions catch(e){
      return left(ServerFailure(e.message));
    }catch(e){
      return left(ServerFailure(e.toString()));

    }
    
  }
  
  @override
  Future<Either<Failures, ErrorModel>> deleteInterest(int eventId) async{
    try{
      var deleteinterest=await DeleteinterestService(api: Api(dio: Dio())).deleteInterest(eventId: eventId);
      return Right(deleteinterest);
    }on CustomExceptions catch(e){
      return left(ServerFailure(e.message));
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }
}
