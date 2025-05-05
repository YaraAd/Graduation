import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eventk/Core/errors/exceptions.dart';
import 'package:eventk/Core/errors/failures.dart';
import 'package:eventk/Core/utils/change_password_service.dart';
import 'package:eventk/Core/utils/delete_profile_service.dart';
import 'package:eventk/Features/Profille/Data/models/change_password.dart';
import 'package:eventk/Features/Profille/Data/models/deleteProfile_model.dart';
import 'package:eventk/Features/Profille/Data/models/profile_model.dart';
import 'package:eventk/Features/Profille/Domain/profile_repo.dart';
import 'package:eventk/helper/api.dart';

class ProfilerepoImpl implements ProfileRepo {
  @override
  Future<Either<Failures, ChangepasswordModel>> changePassword(
      {required String oldPass,
      required String newPass,
      required String confirmPass}) async {
    try {
      var changePass = await ChangepasswordService(api: Api(dio: Dio()))
          .changePass(oldPass, newPass, confirmPass);
      return right(changePass!);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, DeleteprofileModel>> deleteProfile(
      {required String oldPass}) async {
    try {
      var deleteProf = await DeleteProfileService(api: Api(dio: Dio()))
          .deleteProfile(oldPass);
      return right(deleteProf!);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProfileModel>> fetchProfile() {
    // TODO: implement fetchProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, ProfileModel>> updateProfile() {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
