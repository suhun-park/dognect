import 'package:dognect/common/data/color.dart';
import 'package:dognect/noticeboard/page/freeboard/layout/free_board_dropdown.dart';
import 'package:dognect/noticeboard/page/freeboard/layout/free_board_textField_layout.dart';
import 'package:dognect/noticeboard/page/freeboard/provider/free_board_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../provider/free_board_write_provider.dart';

class FreeBoardWrite extends StatefulWidget {
  const FreeBoardWrite({Key? key}) : super(key: key);

  @override
  State<FreeBoardWrite> createState() => _FreeBoardWriteState();
}

class _FreeBoardWriteState extends State<FreeBoardWrite> {
  @override
  Widget build(BuildContext context) {
    final freeBoardWriteProvider = Provider.of<FreeBoardWriteProvider>(context);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text("자유게시판 글쓰기"),
        backgroundColor: BOTTOMNAVIGATION_COLOR,
        actions: [
          TextButton(
            child: Text("완료",style: TextStyle(fontSize: 20.sp,color: Colors.black),textAlign: TextAlign.center,),
            onPressed: () => freeBoardWriteProvider.freeBoardWriteOnSaved(context),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w,0.h,20.w,0.h),
          child: Column(
            children: [
            FreeBoardDropdown(),
              Divider(
                color: Colors.black,
                height: 1.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.w),
                height: 50.h,
                color: Colors.tealAccent,
                alignment: Alignment.centerLeft,
                child: Text("남을 비방하거나 욕을 하시면 채팅이 제한 될 수 있습니다",textAlign: TextAlign.center,),
              ),
              SizedBox(height: 10.h,),
              FreeBoardTextFieldLayout(
                formKey: freeBoardWriteProvider.titleKey,
                onChanged: (value) => freeBoardWriteProvider.titleOnChanged(value!),
                controller: freeBoardWriteProvider.titleController,
                hintText: '제목을 입력해주세요',
                maxLines: 1,
              ),
              FreeBoardTextFieldLayout(
                formKey: freeBoardWriteProvider.contentKey,
                onChanged:(value) =>freeBoardWriteProvider.contentOnChanged(value!),
                controller: freeBoardWriteProvider.contentController,
                hintText: "내용을 입력해주세요",
                maxLines: 9,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      IconButton(icon:Icon(Icons.camera_alt,size: 30.sp), onPressed: () {

                      },),
                    ],
                  ),
                ),
              )
            ],

          ),
        ),
      ),

    );
  }
}
