import 'package:dartz/dartz.dart';
import 'package:eventk/Core/errors/failures.dart';
import 'package:eventk/Features/Profille/Data/models/change_password.dart';
import 'package:eventk/Features/Profille/Data/models/deleteProfile_model.dart';
import 'package:eventk/Features/Profille/Data/models/profile_model.dart';

abstract class ProfileRepo {
  Future<Either<Failures, ProfileModel>> fetchProfile();
  Future<Either<Failures, ProfileModel>> updateProfile();
  Future<Either<Failures, ChangepasswordModel>> changePassword({
    required String oldPass,
    required String newPass,
    required String confirmPass,
  });
  Future<Either<Failures, DeleteprofileModel>> deleteProfile(
      {required String oldPass});
}
