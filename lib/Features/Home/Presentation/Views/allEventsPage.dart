import 'package:eventk/Core/utils/assests.dart';
import 'package:eventk/Core/widgets/searchTextField.dart';
import 'package:eventk/Features/Home/Data/model/get_events_model/get_events_model.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/allEventsFilterTabBar.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/iconNotification.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/seeMoreEventsDetalies.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/seeMoreEventsListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllEventsPage extends StatelessWidget {
  AllEventsPage({super.key, this.events});
  final GetEventsModel? events;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.h,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Image(
          image: AssetImage(AssestsImages.backgroundEvents),
          fit: BoxFit.cover,
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: SearchFields()),
            IconNotification(),
          ],
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              AllEventsFilterTabBar(),
              SeeMoreEventsListView(events: events),
            ],
          ),
        )
      ]),
    );
  }
}
