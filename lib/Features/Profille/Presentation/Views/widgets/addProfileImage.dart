import 'dart:typed_data';

import 'package:eventk/Core/utils/assests.dart';
import 'package:eventk/Core/utils/pick_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

/*Yara Adel*/
class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  Uint8List? image;

  void SelectImage() async {
    Uint8List img = await PickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image != null
            ? CircleAvatar(
                radius: 65.sp,
                backgroundImage: MemoryImage(image!),
              )
            : CircleAvatar(
                radius: 65.sp,
                backgroundImage: AssetImage(AssestsImages.profileAvatar),
              ),
        Positioned(
          bottom: -9.h,
          left: 80.w,
          child: IconButton(
              onPressed: () {
                SelectImage();
              },
              icon: Icon(
                Icons.add_a_photo_outlined,
                color: Colors.black,
                size: 25,
              )),
        ),
      ],
    );
  }
}
