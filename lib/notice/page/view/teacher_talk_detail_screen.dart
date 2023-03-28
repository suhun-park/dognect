import 'package:dognect/common/data/color.dart';
import 'package:dognect/home/provider/home_provider.dart';
import 'package:dognect/notice/page/provider/teacher_talk_detail_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TeacherTalkDetailScreen extends StatelessWidget {
  const TeacherTalkDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teacherTalkProvider = Provider.of<TeacherTalkDetailProvider>(context);
    return Scaffold
      ( backgroundColor: BACKGROUND_COLOR,
        body: FutureBuilder(
          future: teacherTalkProvider.teacherTalkDataGet(),
          builder: (context,snapshot){
            final teacherSnapshotData = snapshot.data;
            if(snapshot.hasError){
              return Container();
            }else if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.all(10.h),
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1.w,color: Colors.black),
                    borderRadius: BorderRadius.circular(10.w)
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FutureBuilder(
                            future: teacherTalkProvider.getTeacherTalkImageGet(context),
                            builder: (context, snapshot) {
                              final teacherTalkImageGet = snapshot.data;
                              if(snapshot.hasError){
                                return Container();
                              }else if(snapshot.hasData){

                                return  Container(
                                  margin: EdgeInsets.all(10.w),
                                  width: 50.w,height: 50.h,
                                  decoration:  BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(teacherTalkImageGet?[index]),),
                                  ),
                                );
                              }
                              return const CircularProgressIndicator();
                            }
                          ),
                          SizedBox(width: 10.w,),
                          Text('${teacherSnapshotData?[index].name}(${teacherSnapshotData![index].manager})\n${teacherSnapshotData?[index].phone}')
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Text(teacherSnapshotData![index].content!)),
                    ],
                  ),
                );
              });
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
