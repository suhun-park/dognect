import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dognect/common/data/color.dart';
import 'package:dognect/noticeboard/page/freeboard/model/free_board_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/free_board_provider.dart';

class FreeBoardScreen extends StatelessWidget {
  const FreeBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final freeBoardProvider = Provider.of<FreeBoardProvider>(context, listen: true);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push("/freeBoardWrite"),
        backgroundColor: BOTTOMNAVIGATION_COLOR,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35.sp,
        ),
      ),
      backgroundColor: BACKGROUND_COLOR,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamProvider<List<FreeBoardModel>>(
          create: (_) => freeBoardProvider.createStream(),
          initialData: freeBoardProvider.freeBoardData,
            child: Consumer<List<FreeBoardModel>>(
              builder: (context, data,_) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(5.w,10.h,5.w,0.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        width: double.infinity,
                        height: 300.h,
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 45.w,
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            data[index].profileImage.toString(),
                                          ),
                                        )),
                                  ),
                                  SizedBox(width: 20.w,),
                                  Flexible(
                                    fit: FlexFit.tight,
                                      child: Text(data[index].nickName.toString())),
                                  Text(data[index].elapsedTime.toString()),
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Text(data[index].title!),
                              SizedBox(height: 10.h,),
                              Flexible(
                                fit: FlexFit.tight,
                                  child: Text(data[index].content!)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => freeBoardProvider.addLike(context, data[index].boardId.toString()),
                                        child: Icon(Icons.favorite_outline_outlined),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Flexible(
                                    fit: FlexFit.tight,
                                      child: Text(data[index].likeCount.toString())),
                                  InkWell(
                                    onTap: () {},
                                  child: Icon(Icons.chat_bubble_outline_rounded),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Flexible(fit:FlexFit.tight,child: Text(data[index].commentCount.toString())),
                            ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
            )),
      ),
    );
  }
}