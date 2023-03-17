import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/page/model/memo_model.dart';
import 'package:dognect/common/page/widget/calendar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../home/provider/home_provider.dart';
import '../provider/calendar_provider.dart';
import '../widget/modal_bottom_sheet_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final calendarProvider = CalendarProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calendarProvider.init(context);
    calendarProvider.memoEventFunction();
  }
  Widget build(BuildContext context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: ModalBottomSheetWidget(),
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        title: Text('달력'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CalendarWidget(),
            StreamBuilder<List<MemoModel>>(
                stream: calendarProvider.memoDataStream,
                initialData: calendarProvider.memoModelData,
                builder: (context,snapshot){
                  final snapshotData = snapshot.data;
              if(snapshot.hasError) {
                return Text("데이터가 없습니다");
              }else if(snapshot.hasData){
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 40.h,
                      color: Colors.cyan,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10.w),
                              child: Text(calendarProvider.selectChangedDay)),
                          Container(
                              margin: EdgeInsets.only(right: 10.w),
                              child: Text('${snapshot.data!.length.toString()}개')),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap:true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context,index){
                          return Container(
                            margin: EdgeInsets.fromLTRB(10.w,20.h,10.w,0),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.cyanAccent),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: InkWell(
                              onTap: (){},
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0.h,),
                                title: Text(snapshotData![index].memo.toString(),textAlign: TextAlign.left,),
                                leading: Container(
                                  margin: EdgeInsets.only(left: 5.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Text(snapshotData![index].firstTime.toString(),style: TextStyle(fontSize: 15.sp,color: Colors.cyan,)),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(snapshotData![index].finalTime.toString(),style: TextStyle(fontSize: 12.sp,color: Colors.cyan,)),
                                  ],),
                                ),
                                trailing: Container(
                                  margin: EdgeInsets.only(right: 20.w),
                                  width: 15.w,
                                  height: 15.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Colors.black),
                                    shape: BoxShape.circle,
                                    color: Color(int.parse(snapshotData![index].color!)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                );
              }
              return CircularProgressIndicator();
            }
            ),


          ],
        ),
      ),
    );
  }
}
