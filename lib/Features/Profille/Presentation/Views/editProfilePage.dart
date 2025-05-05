import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Core/widgets/birthDateTextField.dart';
import 'package:eventk/Core/widgets/buttons.dart';
import 'package:eventk/Core/widgets/nameTextField.dart';
import 'package:eventk/Features/Profille/Presentation/Views/widgets/addProfileImage.dart';
import 'package:eventk/Features/Profille/Presentation/Views/widgets/bioTextField.dart';
import 'package:eventk/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

/*Yara Adel❤️*/
GlobalKey<FormState> formKey = GlobalKey();
final TextEditingController nameCotroller = TextEditingController();
final TextEditingController firstCotroller = TextEditingController();
final TextEditingController lastCotroller = TextEditingController();
final TextEditingController bioController = TextEditingController();
final TextEditingController birthdateController = TextEditingController();
final InputName userName = InputName(label: 'User Name', InitialValue: '');
final InputName firstName = InputName(label: 'First Name', InitialValue: '');
final InputName lastName = InputName(label: 'Last Name', InitialValue: '');

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  static String id = 'EditProfile';
  final bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading!,
        progressIndicator: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kButtonsColor),
        ),
        child: Form(
          key: formKey,
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Edit your profile',
                    style: Styles.headingText40,
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.h)),
                  ProfileImage(),
                  NameTextField(i: userName, NameController: nameCotroller),
                  NameTextField(i: firstName, NameController: firstCotroller),
                  NameTextField(i: lastName, NameController: lastCotroller),
                  Padding(padding: EdgeInsets.only(top: 30.h)),
                  Biotextfield(BioCont: bioController),
                  BirthDateTextField(
                    birthdateController: birthdateController,
                  ),
                  Padding(padding: EdgeInsets.only(top: 30.h)),
                  Buttons(text: 'Edit', onPressedCallBack: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
