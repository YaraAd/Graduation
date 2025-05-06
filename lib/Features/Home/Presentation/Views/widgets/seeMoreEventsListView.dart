import 'package:eventk/Features/Home/Data/model/get_events_model/get_events_model.dart';
import 'package:eventk/Features/Home/Data/model/get_events_model/item.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/allEventsFilterTabBar.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/seeMoreEventsDetalies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeMoreEventsListView extends StatelessWidget {
  SeeMoreEventsListView({super.key, this.events});
  final GetEventsModel? events;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h * (events!.items.length),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: events!.items.length,
                itemBuilder: (context, index) {
                  return SeeMoreEventsDetalies(item: events!.items[index]);
                }),
          ),
        ],
      ),
    );
  }
}
