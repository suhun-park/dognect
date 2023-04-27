import 'dart:async';

import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/page/chat_gpt/model/chat_gpt_model.dart';
import 'package:dognect/common/page/chat_gpt/provider/chat_gpt_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ChatGptScreen extends StatefulWidget {
  const ChatGptScreen({Key? key}) : super(key: key);

  @override
  State<ChatGptScreen> createState() => _ChatGptScreenState();
}

class _ChatGptScreenState extends State<ChatGptScreen> {
  @override
  Widget build(BuildContext context) {
    final chatGptProvider = Provider.of<ChatGptProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BOTTOMNAVIGATION_COLOR,
        title: Text("유치원AI"),
      ),
      body: Stack(
        children: [
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: chatGptProvider.chatList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 14.w,
                          right: 14.w,
                          top: 10.h,
                          bottom: 10.h),
                      child:Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (Colors.grey.shade200),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            chatGptProvider.userList[index]!,
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        ),
                      )),
                    StreamProvider<ChatGptModel>(
                      create: (_) => chatGptProvider.chatStreamController.stream,
                      initialData: ChatGptModel(content: "궁금하신거 물어봐주세요"),
                      catchError: (_, error) => ChatGptModel(content: "오류 발생!"),
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 14.w,
                              right: 14.w,
                              top: 10.h,
                              bottom: 10.h),
                          child:Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (Colors.grey.shade200),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Text(
                                chatGptProvider.chatList[index]!,
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ),
                          )),

                    ),
                  ],
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  width: 340.w,
                  height: 60.h,
                  margin: EdgeInsets.fromLTRB(20.w, 0, 0, 20.w),
                  child: Form(
                    key: GlobalKey(),
                    child: TextFormField(
                      controller: chatGptProvider.textController,
                      decoration: InputDecoration(
                        hintText: '텍스트를 입력해주세요',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.w,
                            color: BOTTOMNAVIGATION_COLOR,
                          ),
                          borderRadius: BorderRadius.circular(30.sp),
                        ),
                      ),
                      onChanged: (value) =>
                          chatGptProvider.chatGptValue(value!),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20.w),
                    child: IconButton(
                      onPressed: () {
                        chatGptProvider.setText();
                        chatGptProvider.generateText();
                      },
                      icon: Icon(Icons.send, size: 24.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
