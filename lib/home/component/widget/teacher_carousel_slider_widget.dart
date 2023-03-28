import 'package:carousel_slider/carousel_slider.dart';
import 'package:dognect/notice/page/provider/teacher_talk_detail_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TeacherCarouselSliderWidget extends StatelessWidget {
  const TeacherCarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teacherTalkProvider = Provider.of<TeacherTalkDetailProvider>(context);
    return FutureBuilder<List>(
      future: teacherTalkProvider.teacherTalkDataGet(),
      builder: (context, AsyncSnapshot<List> snapshot) {
        final teacherTalkData = snapshot.data;
        if (snapshot.hasError) {
          return Container();
        } else if (snapshot.hasData) {
          return CarouselSlider.builder(
            carouselController: teacherTalkProvider.controller,
            itemCount: teacherTalkData!.length,
            itemBuilder: (context, index, _) {
              return Container(
                width: double.infinity,
                height: 100.h,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(10.h),
                    width: double.infinity,
                    height: 180.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.w, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            FutureBuilder(
                              future: teacherTalkProvider.getTeacherTalkImageGet(context),
                              builder: (context, snapshot) {
                                final teacherTalkImageGet = snapshot.data;
                                if (snapshot.hasError) {
                                  return Container();
                                } else if (snapshot.hasData) {
                                  return Container(
                                    margin: EdgeInsets.all(10.w),
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(teacherTalkImageGet?[index]),
                                      ),
                                    ),
                                  );
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                            SizedBox(width: 10.w),
                            Text(
                                '${teacherTalkData[index].name}(${teacherTalkData[index].manager})\n${teacherTalkData[index].phone}'),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Text(teacherTalkData[index].content!),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              aspectRatio: 2.0.h,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) => teacherTalkProvider.pageController(index),
              enableInfiniteScroll: true,
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}