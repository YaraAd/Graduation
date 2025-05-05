import 'package:eventk/constants.dart';
import 'package:eventk/Features/Search/Presentation/Views/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*Yara Adel*/
class SearchFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 210.w,
        child: TextFormField(
          cursorColor: const Color.fromARGB(201, 11, 11, 11),
          cursorHeight: 24,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0.h,
              horizontal: 8.0.w,
            ),
            border: OutlineInputBorder(),
            labelText: 'Search Events',
            prefixIcon: Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              // borderSide: BorderSide(color: kButtonsColor),
              borderRadius: BorderRadius.all(Radius.circular(20)).w,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                // color: kButtonsColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)).w,
            ),
            floatingLabelStyle: TextStyle(
              color: const Color.fromARGB(201, 11, 11, 11),
            ),
          ),
        ),
      ),
    );
  }
}
