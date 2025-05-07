import 'package:eventk/Core/utils/assests.dart';
import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Features/Home/Data/model/get_events_model/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';

class SeeMoreEventsDetalies extends StatelessWidget {
  SeeMoreEventsDetalies({super.key, this.item});
  final Item? item;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 120.h,
          maxHeight: 120.h,
          minWidth: 120.w,
          maxWidth: 120.w,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 120.h,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 120.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AssestsImages.testImagePopluar),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 20.h)),
                Align(
                  alignment: Alignment.topLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5,
                    ),
                    child: Text(
                      item!.eventName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Styles.styleText20,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20.h)),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        DateFormat('MMM dd, yyyy – hh:mm a')
                            .format(item!.startDate!),
                        style: Styles.styleText12.copyWith(color: Colors.blue),
                      ),
                      IconButton(onPressed: () {}, icon: LineIcon.star()),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
