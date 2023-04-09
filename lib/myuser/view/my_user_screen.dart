import 'package:dognect/common/data/color.dart';
import 'package:dognect/home/provider/home_provider.dart';
import 'package:dognect/myuser/provider/my_user_provider.dart';
import 'package:dognect/user/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../common/layout/custom_image_box.dart';
import '../common/layout/profile_option.dart';

class MyUserScreen extends StatelessWidget {

  const MyUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final myUserProvider = Provider.of<MyUserProvider>(context);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 45),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       SizedBox(height: 20.h),
                       Text(
                        '프로필',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34.sp),
                      ),
                       SizedBox(height: 60.h),
                      Card(
                        elevation: 0,
                        margin:  EdgeInsets.only(bottom: 10.w),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.w),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding:
                           EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                 SizedBox(height: 12.h),
                                 FutureBuilder<String>( //이미지 데이터 가져오기
                                        future: homeProvider.getUserImage(context),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
                                            return Text("error");
                                          } else if (snapshot.hasData) {
                                            return Container(
                                              width: 80.w, height: 80.h,
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
                                 SizedBox(height: 20.h,),
                                 Text(
                                   '${userProvider.userMyModelData[0].nickName}님' ,
                                  style: TextStyle(
                                      fontSize: 18.sp, fontWeight: FontWeight.w600),
                                ),
                                 SizedBox(height: 12.h),
                                Text('${userProvider.userMyModelData[0].kinderGarden}반')
                              ]),
                        ),
                      ),
                      ProfileOption(text: '프로필수정', onClick: () {
                      }),
                      ProfileOption(text: '유치원변경', onClick: () {}),
                      ProfileOption(text: '고객센터', onClick: () {}),
                      ProfileOption(text: '이용내역', onClick: () {}),
                      ProfileOption(text: '공지사항', onClick: () {}),
                      ProfileOption(text: '약관정책', onClick: () {}),
                      ProfileOption(text: '버전정보', onClick: () {}),
                      ProfileOption(text: '로그아웃', onClick: () => myUserProvider.signOut()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
