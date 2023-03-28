import 'package:dognect/notice/common/widget/notice_calendar_widget.dart';
import 'package:dognect/notice/page/common/layout/button_style_layout.dart';
import 'package:dognect/notice/page/model/notice_model.dart';
import 'package:dognect/notice/page/provider/notice_detail_provider.dart';
import 'package:dognect/notice/provider/notice_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../common/data/color.dart';

class NoticeDetailScreen extends StatelessWidget {
  const NoticeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noticeProvider = Provider.of<NoticeProvider>(context);
    final noticeDetailProvider = Provider.of<NoticeDetailProvider>(context);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      /*floatingActionButton:ButtonStyleLayout(
        onPressed: () => context.push('/noticeDetailWriteScreen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,*/
      body: Center(
        child: Column(
          children: [/*
            Visibility(
              visible: noticeProvider.isShow,
              child: NoticeCalendarWidget(),),
            TextButton(onPressed: () => noticeProvider.hideCallBack()
                , child:noticeProvider.isShow ?  Text("닫기") : Text("시간 설정하기",style: TextStyle(color: Colors.cyan),)),

*/
            FutureBuilder<List<NoticeModel>>(
              future: noticeDetailProvider.noticeDataGet(),
                builder: (context,snapshot){
              if(snapshot.hasError){
                 context.pop();
              }else if(snapshot.hasData){
                final snapshotData = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index){
                  return Container(
                    margin: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0.w,color: Colors.black),
                      borderRadius: BorderRadius.circular(10.w),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    height: 150.h,
                    child: InkWell(
                      onTap: (){},
                      child: Column(
                        children: [
                                  Container(
                                    margin: EdgeInsets.all(10.w),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(snapshotData![index]
                                              .title
                                              .toString()),
                                          Text(snapshotData![index]
                                              .date
                                              .toString()),
                                        ]),
                                  ),
                          Container(
                            margin: EdgeInsets.all(10.w),
                            alignment:Alignment.topLeft,
                              child: Text(snapshotData![index].content.toString(),)),
                        ],
                      ),
                    ),
                  );
                });
              } return const CircularProgressIndicator();
            }
            )

          ],

        ),
      ),
    );
  }
}
