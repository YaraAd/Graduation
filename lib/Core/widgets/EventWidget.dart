import 'package:eventk/Core/utils/assests.dart';
import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Features/Intersted/Data/models/getInterest_model.dart';
import 'package:eventk/Features/Intersted/Presentation/Views/manager/cubits/addInterest_cubit/addInterest_cubit.dart';
import 'package:eventk/Features/Intersted/Presentation/Views/manager/cubits/addInterest_cubit/addInterest_states.dart';
import 'package:eventk/Features/Intersted/Presentation/Views/manager/cubits/deleteInterest_cubit/deleteInterest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

class EventCard extends StatefulWidget {
  final EventsModel event;
  const EventCard({super.key, required this.event});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('yyyy-MM-dd – kk:mm')
        .format(DateTime.parse(widget.event.startDate));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 4.h),
      child: Column(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Container(
                    width: 320.w,
                    height: 300.h,
                  ),
                  Positioned(
                    bottom: 120.h,
                    left: 0.w,
                    child: Container(
                      height: 170.h,
                      width: 380.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(AssestsImages.backgroundEvents),
                          //untill back put event photo
                          // NetworkImage(widget.event.eventPicture),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70.h,
                    child: Container(
                      width: 320.w,
                      height: 75.h,
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
                            formattedDate,
                            style:
                                Styles.styleText15.copyWith(color: Colors.blue),
                          ),
                          Text(
                            widget.event.eventName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Styles.styleText20,
                          ),
                          Text(
                            'Tahir Square',
                            style: Styles.styleText15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 265.w,
                    bottom: 130.h,
                    child: Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(174, 255, 255, 255),
                        ),
                        child:
                            BlocConsumer<AddinterestCubit, AddinterestStates>(
                                listener: (context, state) {
                          if (state is AddInterestSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message.message)),
                            );
                          }
                          if (state is AddInterestErrorState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.errorMessage)),
                            );
                          }
                        }, builder: (context, state) {
                          bool isInterested = widget.event.isInterested;
                          return RiveAnimatedIcon(
                            riveIcon: RiveIcon.star,
                            width: 12.w,
                            height: 12.h,
                            color: Colors.blue,
                            strokeWidth: 3,
                            loopAnimation: false,
                            onTap: () {
                              if (isInterested) {
                                context
                                    .read<DeleteinterestCubit>()
                                    .deleteInterest(widget.event.eventId);
                              } else {
                                context
                                    .read<AddinterestCubit>()
                                    .addInterest(widget.event.eventId);
                              }
                            },
                            onHover: (value) {},
                          );
                        })),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
