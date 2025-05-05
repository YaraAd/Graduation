import 'package:dio/dio.dart';
import 'package:eventk/Core/Services/get_it_services.dart';
import 'package:eventk/Core/dataBase/Cache/Cache_Helper.dart';
import 'package:eventk/Core/utils/User%E2%80%99sLatitudeaLongitude.dart';
import 'package:eventk/Core/utils/assests.dart';
import 'package:eventk/Core/utils/get_events_service.dart';
import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/eventsNearYouListView.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/exploreCategoriesListView.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/homeText.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/iconNotification.dart';
import 'package:eventk/Core/widgets/searchTextField.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/organizationListView.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/popularEventsListView.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/upComingEventsDate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/*Yara Adel*/
class HomePage extends StatefulWidget {
  HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

double? lat, long;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    location();
  }

  Future<void> location() async {
    await Userislatitudealongitude().GetLocation();
    lat = getIt<CacheHelper>().getData(key: 'latitude');
    long = getIt<CacheHelper>().getData(key: 'longitude');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          automaticallyImplyLeading: false,
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
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 30.h, left: 8.w)),
                  HomeTextHeading(text: 'Explore Categories'),
                  Padding(padding: EdgeInsets.only(top: 12.h)),
                  Explorecategorieslistview(),
                  HomeTextHeading(text: 'Popular Events'),
                  Populareventslistview(),
                  HomeTextHeading(text: 'Events Near For You'),
                  EventsNearYouListView(lat: lat, long: long),
                  //HomeTextHeading(text: 'Upcoming Events'),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.h),
                      child: Text(
                        'Upcoming Events',
                        style: Styles.styleText20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 350.h,
                    child: const UpComingEventsDate(),
                  ),
                  //HomeTextHeading(text: 'Organization to follow'),
                ],
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: OrganizationListView()),
            )
          ],
        ));
  }
}
