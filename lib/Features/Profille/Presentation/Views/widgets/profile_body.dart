import 'package:dio/dio.dart';
import 'package:eventk/Core/dataBase/Cache/Cache_Helper.dart';
import 'package:eventk/Core/utils/AuthProvider.dart';
import 'package:eventk/Core/utils/editProfile_service.dart';
import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Features/Authentication/Presentation/Views/loginPage.dart';
import 'package:eventk/Features/Profille/Presentation/Views/changePassword.dart';
import 'package:eventk/Features/Profille/Presentation/Views/deleteProfile.dart';
import 'package:eventk/Features/Profille/Presentation/Views/editProfilePage.dart';
import 'package:eventk/Features/Profille/Presentation/Views/widgets/Profile_Header.dart';
import 'package:eventk/Features/Profille/Presentation/Views/widgets/Profile_listTile.dart';
import 'package:eventk/Features/Profille/Presentation/Views/widgets/showProfileImage.dart';
import 'package:eventk/Features/Profille/Presentation/manager/cubits/profile_cubit/editProfile_cubit.dart';
import 'package:eventk/Features/Profille/Presentation/manager/cubits/profile_cubit/profile_cubit.dart';
import 'package:eventk/Features/Profille/Presentation/manager/cubits/profile_cubit/profile_state.dart';
import 'package:eventk/helper/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:typed_data' as typed_data;

import 'package:provider/provider.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  typed_data.Uint8List? _localImage;
  String? _currentProfilePicUrl;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileCubit>().fetchProfile();
    });
  }

  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoadedState) {
          setState(() {
            _currentProfilePicUrl = state.profile.profilePic;
          });
        }
        /*
        if (state is ProfileErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
        */
      },
      
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        final profile = state is ProfileLoadedState ? state.profile : null;
        return Scaffold(
          body: Stack(
            children: [
              ProfileHeader(),
              Showprofileimage(
                profilePictureUrl: profile?.profilePic,
                localImage: _localImage,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 180.0),
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                        SizedBox(
                          height: 15.h,
                        ),
                        Center(
                          child: Text(
                            profile != null
                                ? "${profile.firstName} ${profile.lastName}"
                                : "Hi, Guest User",
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Column(
                          children: [
                            Text(
                              profile?.userName ?? "",
                              style: Styles.styleText16
                                  .copyWith(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                        
                  ]
                
                ),
              ),
              SizedBox(height: 100.h,),
              
             
              Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: SingleChildScrollView(
                  child: 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /*
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        profile != null
                            ? "${profile.firstName} ${profile.lastName}"
                            : "Hi, Guest User",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 6.h),
                      Column(
                        children: [
                          Text(
                            profile?.userName ?? "",
                            style: Styles.styleText16
                                .copyWith(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      */
                      SizedBox(height: 20.h),
                      ProfileListtile(
                        icon: Icons.edit,
                        text: "Edit Profile",
                        onTap: () {
                          if (profile != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                      value: profileCubit,
                                    ),
                                    BlocProvider(
                                      create: (context) => EditprofileCubit(
                                        profile,
                                        service: EditprofileService(
                                            api: Api(dio: Dio())),
                                      ),
                                    )
                                  ],
                                  child: EditProfilePage(profile: profile),
                                ),
                              ),
                            ).then((_) {
                              context.read<ProfileCubit>().fetchProfile();
                            });
                          }
                        },
                      ),
                      ProfileListtile(
                          icon: Icons.history,
                          text: "Booking History",
                          onTap: () {}),
                      ProfileListtile(
                          icon: Icons.history,
                          text: "Following List",
                          onTap: () {}),
                      ProfileListtile(
                          icon: Icons.lock_outline,
                          text: "Change Password",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChangePassword()));
                          }),
                      ProfileListtile(
                          icon: Icons.note_outlined,
                          text: "Terms & Conditions",
                          onTap: () {}),
                      ProfileListtile(
                          icon: Icons.info_outline,
                          text: "About Us",
                          onTap: () {}),
                      ProfileListtile(
                          icon: Icons.delete_forever,
                          text: "Delete Profile",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DeleteProfile()));
                          }),
                      ProfileListtile(
                          icon: Icons.logout,
                          text: "Logout",
                          onTap: () {
                            showLogoutDialog(context);
                          }),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout", style: TextStyle(color: Colors.black)),
          content: Text(
            "Are you sure you want to logout?",
            style: TextStyle(color: Color.fromARGB(255, 101, 35, 112)),
          ),
          actions: [
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Color.fromARGB(255, 101, 35, 112)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Logout", style: TextStyle(color: Colors.red)),
              onPressed: () async {
                try {
                 Provider.of<Authprovider>(context, listen: false).logout();
                  if (context.mounted) {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamedAndRemoveUntil(
                      LoginPage.id,
                      (route) => false,
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Logout failed: ${e.toString()}")),
                    );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}