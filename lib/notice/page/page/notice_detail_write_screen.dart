import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/layout/custom_text_filed_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/layout/notice_detail_title_textform.dart';

class NoticeDetailWriteScreen extends StatelessWidget {
  const NoticeDetailWriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BOTTOMNAVIGATION_COLOR,
        centerTitle: true,
        title: Text("알림장 글쓰기"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: BOTTOMNAVIGATION_COLOR),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(10),
                width: 500.w, height: 90.h,
                child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child:Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2,color: Colors.black),
                            borderRadius: BorderRadius.circular(10)

                          ),
                          width:88.w,
                          height: 90.h,
                          child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: (){}
                          ),
                        ),
                        SizedBox(
                          width: 900.w,child:
                        GridView.builder(
                            itemCount: 1,

                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10,mainAxisSpacing: 10,childAspectRatio: 0.8,),
                            itemBuilder: (BuildContext context, int index){
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2,color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text("dd")
                              );
                            }),
                        ),
                      ],
                    )
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              NoticeDetailTitleTextForm(onChanged: (String) {  },hintText: '제목을 입력해주세요',)
            ],
          ),
        ),
      ),
    );
  }
}