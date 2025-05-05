import 'package:eventk/Core/utils/assests.dart';
import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Core/widgets/buttons.dart';
import 'package:eventk/Features/Profille/Presentation/Views/changePassword.dart';
import 'package:eventk/Features/Profille/Presentation/Views/deleteProfile.dart';
import 'package:eventk/Features/Profille/Presentation/Views/editProfilePage.dart';
import 'package:eventk/Features/Profille/Presentation/Views/widgets/Profile_Header.dart';
import 'package:eventk/Features/Profille/Presentation/Views/widgets/Profile_listTile.dart';
import 'package:eventk/Features/Profille/Presentation/Views/widgets/logoutDialog.dart';
import 'package:eventk/Features/Profille/Presentation/Views/widgets/showProfileImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProfileHeader(),
          Showprofileimage(),
          Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Esraa Ibrahim",
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 6.h),
                  Column(
                    children: [
                      Text(
                        "ESOO",
                        style: Styles.styleText16
                            .copyWith(color: Colors.grey[600]),
                      ),
                      /*
                      Text(
                        "Following: 0",
                        style:
                            Styles.styleText16.copyWith(color: Colors.grey[600]),
                      ),
                      */
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ProfileListtile(
                      icon: Icons.edit,
                      text: "Edit Profile",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfilePage()));
                      }),
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
                      icon: Icons.info_outline, text: "About Us", onTap: () {}),
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
                        Logoutdialog();
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
  }
}
/*
// Method to build the logout button
  Widget buildLogoutButton() {
    return Container(
      width: 320.w,
      height: 61.h,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color(0xffE2E2E2),
          width: 2.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 15.w),
          const Icon(Icons.logout),
          SizedBox(width: 20.w),
          Text(
            "Logout",
            style: TextStyle(
              color: const Color(0xff000000),
              fontSize: 16.sp,
              fontFamily: "Jakarta",
              fontWeight: FontWeight.bold,
              height: 0.963.h,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('authToken');
    
    
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
    context.read<LoginCubit>().emit(LoginInitialState());
  }

*/
