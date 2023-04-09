import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/page/chat_gpt/provider/chat_gpt_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ChatGptScreen extends StatefulWidget {
  const ChatGptScreen({Key? key}) : super(key: key);

  @override
  State<ChatGptScreen> createState() => _ChatGptScreenState();
}

class _ChatGptScreenState extends State<ChatGptScreen> {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final chatGptProvider = Provider.of<ChatGptProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("chatGPT"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Center(
            child: chatGptProvider.widgetCheck ?
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1,color: Colors.black),
              ),
              margin: EdgeInsets.all(10.w),
              child: Text(chatGptProvider.chatText,style: TextStyle(fontSize: 20.sp,),),
            ) : Container(

            ),
              ),
          ),
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
                      controller: _textController,
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
                      onSaved: (value) => chatGptProvider.chatGptValue(value!),

                    ),
                  ),
                ),
                Expanded(child:
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20.w),
                  child: IconButton(
                    onPressed: () => chatGptProvider.generateText(),
                    icon: Icon(Icons.send,size: 24.sp),
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
