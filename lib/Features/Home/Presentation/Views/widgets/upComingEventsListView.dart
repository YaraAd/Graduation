import 'package:eventk/Core/Services/get_it_services.dart';
import 'package:eventk/Core/dataBase/Cache/Cache_Helper.dart';
import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Core/widgets/customErrorWidgets.dart';
import 'package:eventk/Core/widgets/customLoadingWidgets.dart';
import 'package:eventk/Features/Home/Data/model/get_events_model/get_events_model.dart';
import 'package:eventk/Features/Home/Data/model/get_events_model/item.dart';
import 'package:eventk/Features/Home/Presentation/Manager/get_events_cubit.dart';
import 'package:eventk/Features/Home/Presentation/Manager/get_events_state.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/showMoreEvents.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/upComingEvents.dart';
import 'package:eventk/Features/Home/domain/home_repo.dart';
import 'package:eventk/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*Yara❤️*/

class UpComingEventsListView extends StatelessWidget {
  UpComingEventsListView({super.key, this.fromDate, this.toDate});
  final DateTime? fromDate;
  final DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    //2026-02-02T12:05:53.2894461
    String endPoint = '?FromDate=${fromDate}&ToDate=${toDate}';
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
                  "No events found",
                  style: Styles.styleText20,
                )),
              );
            } else {
              return SizedBox(
                height: 250.h,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            if (index < 5) {
                              return UpComingEvents(item: items[index]);
                            } else {
                              return ShowMoreEvents(events:events);
                            }
                          }),
                    ),
                  ],
                ),
              );
            }
          } else if (state is FailureGetEventsState) {
            return CustomErrorWidgets(errMessage: state.errMessage);
          } else {
            return CustomLoadingWidgets();
          }
        }));
  }
}
