import 'package:eventk/Core/utils/assests.dart';
import 'package:flutter/material.dart';

class Showprofileimage extends StatefulWidget {
  const Showprofileimage({super.key});

  @override
  State<Showprofileimage> createState() => _ShowprofileimageState();
}

class _ShowprofileimageState extends State<Showprofileimage> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 75,
      left: MediaQuery.of(context).size.width / 2 - 60,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(AssestsImages.profileAvatar),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade200,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(7),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.remove,
                color: Colors.red.shade400,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
