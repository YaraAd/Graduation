import 'package:dio/dio.dart';
import 'package:eventk/Core/utils/delete_profile_service.dart';
import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Core/widgets/buttons.dart';
import 'package:eventk/Core/widgets/passwordTextField.dart';
import 'package:eventk/Features/Profille/Presentation/Views/widgets/showDialog.dart';
import 'package:eventk/Features/Profille/Presentation/manager/cubits/deleteProfile_cubit/deleteProfile_cubit.dart';
import 'package:eventk/Features/Profille/Presentation/manager/cubits/deleteProfile_cubit/deleteProfile_state.dart';
import 'package:eventk/constants.dart';
import 'package:eventk/helper/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Yara❤️*/

TextEditingController passwordController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey();

class DeleteProfile extends StatelessWidget {
  const DeleteProfile({super.key});
  static String id = 'DeleteProfile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteprofileCubit>(
      create: (context) => DeleteprofileCubit(
        service: DeleteProfileService(api: Api(dio: Dio())),
      ),
      child: Form(
        key: formKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
          ),
          body: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: BlocConsumer<DeleteprofileCubit, DeleteprofileStates>(
                listener: (context, state) {
                  if (state is DeleteProfileSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Profile deleted successfully"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    );
                  } else if (state is DeleteProfileFailureState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorMessage),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(height: 30.h),
                      Text(
                        'Delete Profile',
                        style: Styles.headingText40,
                      ),
                      SizedBox(height: 60.h),
                      Passwordtextfield(
                        passwordController: passwordController,
                        label: 'Old password',
                        page: 'Login',
                      ),
                      SizedBox(height: 50.h),
                      if (state is DeleteProfileLoadingState)
                        const CircularProgressIndicator()
                      else
                        Buttons(
                          text: "Delete Profile",
                          onPressedCallBack: () {
                            if (formKey.currentState!.validate()) {
                              ShowDialog(
                                context,
                                passwordController.text,
                              );
                            }
                          },
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
           BlocConsumer<DeleteprofileCubit, DeleteprofileStates>(
            listener:  (context, state) {
              if (state is! DeleteProfileLoadingState) {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }
              if (state is DeleteProfileSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Profile deleted successfully"),
                  backgroundColor: Colors.green,
                ),
              );
              // Navigate to login screen
              Navigator.pushNamedAndRemoveUntil(
                context, 
                '/login', 
                (route) => false,
              );
            } else if (state is DeleteProfileFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context,state){
            return Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30.h)),
                Text(
                  'Delete Profile',
                  style: Styles.headingText40,
                ),
                Padding(padding: EdgeInsets.only(top: 60.h)),
                Passwordtextfield(
                    passwordController: passwordController,
                    label: 'Old password',
                    page: 'DeleteProfile'),
                Padding(padding: EdgeInsets.only(top: 50)),
                Buttons(
                    text: 'Delete Profile',
                    onPressedCallBack: () {
                      ShowDialog(context,password: passwrd);
                    })
              ],
            ),
          },
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30.h)),
                Text(
                  'Delete Profile',
                  style: Styles.headingText40,
                ),
                Padding(padding: EdgeInsets.only(top: 60.h)),
                Passwordtextfield(
                    passwordController: passwordController,
                    label: 'Old password',
                    page: 'DeleteProfile'),
                Padding(padding: EdgeInsets.only(top: 50)),
                Buttons(
                    text: 'Delete Profile',
                    onPressedCallBack: () {
                      ShowDialog(context,password: passwrd);
                    })
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
*/
