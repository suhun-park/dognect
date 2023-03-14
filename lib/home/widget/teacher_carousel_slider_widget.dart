import 'package:carousel_slider/carousel_slider.dart';
import 'package:dognect/home/provider/teacher_carousel_slider_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../user/model/teacher_model.dart';

class TeacherCarouselSliderWidget extends StatelessWidget {
  const TeacherCarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teacherCarouselSliderProvider = Provider.of<TeacherCarouselSliderProvider>(context);
    return FutureBuilder<List<TeacherModel>>(
      future: teacherCarouselSliderProvider.teacherDataGet(),
      builder: (context,AsyncSnapshot<List>snapshot){
        if(snapshot.hasError){
          return Text("에러입니다 다시 접속해주세요");
        }else if(snapshot.hasData){
          print(snapshot.data);
          return CarouselSlider(
            items: snapshot!.data?.map((e) =>Container(
              color: Colors.white,
              child: /*Row(
                children: [
                  FutureBuilder<String>( //이미지 데이터 가져오기
                      future: homeProvider.getUserImage(context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text("error");
                        } else if (snapshot.hasData) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(35.w, 5.h, 0,0),
                            width: 63.w, height: 60.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(snapshot.data!,
                                  ),
                                )
                            ),
                          );
                        }
                        return CircularProgressIndicator();
                      }),

                ],
              )*/Text('수정중'),

            ) ).toList(), options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 17.w/ 6.h
          ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
