import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventk/Core/utils/assests.dart';
import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Features/Home/Data/model/get_events_model/item.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/convertStartDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

/*Yara Adel*/
class PopularEvents extends StatefulWidget {
  PopularEvents({super.key, required this.item});
  final Item item;
  @override
  State<PopularEvents> createState() => _PopularEventsState();
}

class _PopularEventsState extends State<PopularEvents> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 9.w, top: 5.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 250.h,
        ),
        child: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 320.w,
                  height: 250.h,
                ),
                Positioned(
                  bottom: 80.h,
                  left: 0.w,
                  child: Container(
                    height: 170.h,
                    width: 320.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: CachedNetworkImageProvider(
                          widget.item.eventPicture ??
                              AssestsImages.testImagePopluar,
                          errorListener: (err) =>
                              Image.asset(AssestsImages.testImagePopluar),
                        ),
                        // image: NetworkImage(widget.item.eventPicture),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30.h,
                  child: Container(
                    width: 320.w,
                    height: 75.h,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.item.eventName!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Styles.styleText20,
                        ),
                        Text(
                          DateFormat('MMM dd, yyyy – hh:mm a')
                              .format(widget.item.startDate!),
                          style:
                              Styles.styleText15.copyWith(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 265.w,
                  bottom: 90.h,
                  child: Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(174, 255, 255, 255),
                      ),
                      child: RiveAnimatedIcon(
                        riveIcon: RiveIcon.star,
                        width: 12.w,
                        height: 12.h,
                        color: Colors.blue,
                        strokeWidth: 3,
                        loopAnimation: false,
                        onTap: () {},
                        onHover: (value) {},
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
