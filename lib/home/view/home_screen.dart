import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/view/root_tab.dart';
import 'package:dognect/home/layout/tab_button_layout.dart';
import 'package:dognect/home/widget/ad_carousel_slider_widget.dart';
import 'package:dognect/home/provider/home_provider.dart';
import 'package:dognect/user/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:provider/provider.dart';

import '../provider/ad_carousel_slider_provider.dart';
import '../widget/teacher_carousel_slider_widget.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final homeProvider = Provider.of<HomeProvider>(context,listen: false);
    homeProvider.customDateChange();

  }
  @override

  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    homeProvider.customDateChange();
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Column(
            children: [
              Row(
                children: [
                  FutureBuilder<String>( //이미지 데이터 가져오기
                      future: homeProvider.getUserImage(context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text("error");
                        } else if (snapshot.hasData) {
                          return InkWell(
                            onTap: (){} , //수정부분
                            child: Container(
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
                            ),
                          );
                        }
                        return CircularProgressIndicator();
                      }),

                  Container( //1열 가로

                    width: 180.w,
                    height: 68.h,
                    padding: EdgeInsets.fromLTRB(0, 14.h, 0, 5.h),
                    margin: EdgeInsets.only(left: 25.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('안녕하세요, ${userDataProvider.userMyModelData[0].nickName}님',
                          style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                        Text(homeProvider.formatData,style: TextStyle(fontSize: 17.sp),),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(50.w, 0, 10.w, 0),
                    padding: EdgeInsets.only(top: 3.h),
                    height: 68.h,
                    width: 60.w,
                    child:IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size: 50.h,)),
                  )

                ],
              ),
              Container( //2열 가로
                padding: EdgeInsets.only(top: 15.h),
                margin: EdgeInsets.fromLTRB(35.w, 5.h, 0,0),
                height: 110.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('신선한 오늘,',style: TextStyle(fontSize: 19.sp,fontWeight: FontWeight.bold),),
                          Text('반려견과 함께 산책 어떤가요?',style: TextStyle(fontSize: 19.sp,fontWeight: FontWeight.bold),),
                          Gap(5),
                          Text('강아지의 하루는 인간의 3일입니다.',style: TextStyle(fontSize: 15.sp,),),
                          Text('하루의 산 3~4번은 기본!',style: TextStyle(fontSize: 15.sp,),),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: Container(
                        child: Image.asset(
                        'assets/img/walkDog.png',
                        fit: BoxFit.cover,
                      ),
                          ),
                    ),
                  ],
                ),
              ),
              const TabButtonLayout(),
              SizedBox(
                height: 30.h,
              ),
              const AdCarouselSliderWidget(), // 광고 슬라이더

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(35.w,25.h,0,0),
                    child: Text("선생님이 전하는 오늘의 한마디",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                  )
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              const TeacherCarouselSliderWidget(),


            ],
          ),
        ),
      );
      //endDrawer: HomeDrawer()

  }
}


