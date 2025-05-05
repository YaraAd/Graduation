import 'package:eventk/Core/Services/get_it_services.dart';
import 'package:eventk/Core/dataBase/Cache/Cache_Helper.dart';
import 'package:eventk/Core/utils/User%E2%80%99sLatitudeaLongitude.dart';
import 'package:eventk/Core/utils/get_current_position_service.dart';
import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Core/widgets/customErrorWidgets.dart';
import 'package:eventk/Core/widgets/customLoadingWidgets.dart';
import 'package:eventk/Features/Home/Data/model/get_events_model/get_events_model.dart';
import 'package:eventk/Features/Home/Data/model/get_events_model/item.dart';
import 'package:eventk/Features/Home/Presentation/Manager/get_events_cubit.dart';
import 'package:eventk/Features/Home/Presentation/Manager/get_events_state.dart';
import 'package:eventk/Features/Home/Presentation/Manager/get_location_state.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/eventsNearYou.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/showMoreEvents.dart';
import 'package:eventk/Features/Home/domain/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

/*Yara❤️*/

class EventsNearYouListView extends StatefulWidget {
  EventsNearYouListView({super.key, this.lat, this.long});
  final double? lat;
  final double? long;
  @override
  State<EventsNearYouListView> createState() => _EventsNearYouListViewState();
}

class _EventsNearYouListViewState extends State<EventsNearYouListView> {
  Future<void> location() async {
    await Userislatitudealongitude().GetLocation();
  }

  @override
  void initState() {
    super.initState();
    location();
  }

  @override
  Widget build(BuildContext context) {
    // widget.lat = null;
    // widget.long = null;
    // String endPoint = '?Latitude=${widget.lat}&Longitude=${widget.long}';
    String endPoint =
        '?Latitude=${getIt<CacheHelper>().getData(key: 'latitude')}&Longitude=${getIt<CacheHelper>().getData(key: 'longitude')}';
    return BlocProvider(
        create: (context) =>
            GetEventsCubit(getIt<HomeRepo>())..GetEvents(endPoint),
        child: BlocBuilder<GetEventsCubit, GetEventsState>(
            builder: (context, state) {
          if (state is SuccessGetEventsState) {
            GetEventsModel events = state.events;
            List<Item> items = events.items;
            if (items.isEmpty) {
              return SizedBox(
                height: 70.h,
                child: Center(
                    child: Text(
                  "No nearby events found",
                  style: Styles.styleText20,
                )),
              );
            }
            return SizedBox(
              height: 250.h,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          if (index < 5) {
                            return EventsNearYou(item: items[index]);
                          } else {
                            return ShowMoreEvents();
                          }
                        }),
                  ),
                ],
              ),
            );
          } else if (state is FailureGetEventsState) {
            return ElevatedButton(
              onPressed: () async {
                try {
                  await Userislatitudealongitude().GetLocation();
                  setState(() {
                    endPoint =
                        '?Latitude=${getIt<CacheHelper>().getData(key: 'latitude')}&Longitude=${getIt<CacheHelper>().getData(key: 'longitude')}';
                  });

                  context.read<GetEventsCubit>().GetEvents(endPoint);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error fetching location: $e')));
                }
              },
              child: const Text("Get Current Location"),
            );
          } else {
            return CustomLoadingWidgets();
          }
        }));
  }
}
