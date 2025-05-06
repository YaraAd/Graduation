import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllEventsFilterTabBar extends StatefulWidget {
  const AllEventsFilterTabBar({super.key});

  @override
  State<AllEventsFilterTabBar> createState() => _AllEventsFilterTabBarState();
}

class _AllEventsFilterTabBarState extends State<AllEventsFilterTabBar>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 5,
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
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50.h,
            child: TabBar(
                controller: tabController,
                labelColor: Colors.blue,
                labelPadding: EdgeInsets.only(left: 0.w, right: 30.w),
                indicatorColor: Colors.blue,
                indicatorWeight: 3,
                indicatorPadding: EdgeInsets.only(bottom: 4.h),
                indicatorSize: TabBarIndicatorSize.label,
                isScrollable: true,
                tabs: [
                  Tab(
                    icon: Icon(Icons.tune),
                  ),
                  Tab(text: 'Category'),
                  Tab(text: 'Date'),
                  Tab(text: 'Distance'),
                  Tab(text: 'Price'),
                ]),
          ),
          // Expanded(
          //   child: TabBarView(controller: tabController, children: [
          //     // BottomSheet(onClosing: onClosing, builder: builder)
          //   ]),
          // ),
        ],
      ),
    );
  }
}
