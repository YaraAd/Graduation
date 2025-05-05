import 'package:eventk/Features/Home/Presentation/Views/widgets/homeText.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/upComingEventsListView.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/upcomingEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Yara❤️*/

class UpComingEventsDate extends StatefulWidget {
  const UpComingEventsDate({super.key});

  @override
  State<UpComingEventsDate> createState() => _UpComingEventsDateState();
}

final now = DateTime.now();
final DateTime today = DateTime(now.year, now.month, now.day);
final afterWeek = today.add(const Duration(hours: 168));
int currentWeekday = now.weekday; // 1 (Monday) - 7 (Sunday)
int daysUntil = (DateTime.thursday - currentWeekday + 7) % 7;

final DateTime nextThursday = today.add(Duration(days: daysUntil));

final DateTime endOfFriday =
    nextThursday.add(Duration(days: 2)).subtract(Duration(milliseconds: 1));

class _UpComingEventsDateState extends State<UpComingEventsDate>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 6,
      vsync: this,
    );
    tabController.addListener(handleTabChange);
  }

  void handleTabChange() {
    if (tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50.h,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: tabController,
                labelColor: Colors.blue,
                labelPadding: EdgeInsets.only(left: 0.w, right: 30.w),
                indicatorColor: Colors.blue,
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.only(bottom: 4.h),
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: 'This Weekend',
                  ),
                  Tab(
                    text: 'Today',
                  ),
                  Tab(
                    text: 'Tomorrow',
                  ),
                  Tab(
                    text: 'This Week',
                  ),
                  Tab(
                    text: 'Next Week',
                  ),
                  Tab(
                    text: 'This Month',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(controller: tabController, children: [
              UpComingEventsListView(
                fromDate: nextThursday,
                toDate: endOfFriday,
              ),
              UpComingEventsListView(
                fromDate: today,
                toDate: today.add(Duration(hours: 24)),
              ),
              UpComingEventsListView(
                fromDate: today.add(Duration(hours: 24)),
                toDate: today.add(Duration(hours: 48)),
              ),
              UpComingEventsListView(
                fromDate: today,
                toDate: afterWeek,
              ),
              UpComingEventsListView(
                fromDate: today.add(Duration(days: 7)),
                toDate: today.add(Duration(days: 14)),
              ),
              UpComingEventsListView(
                fromDate: today,
                toDate: DateTime(now.year, now.month + 1, 0),
              ),
            ]),
          ),
          HomeTextHeading(text: 'Organization to follow'),
          Padding(padding: EdgeInsets.only(top: 10.h)),
        ],
      ),
    );
  }
}
