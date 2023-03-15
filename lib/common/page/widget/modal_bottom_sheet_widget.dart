import 'package:dognect/common/data/color.dart';
import 'package:dognect/common/layout/custom_text_filed_form.dart';
import 'package:dognect/common/page/provider/modal_bottom_sheet_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

class ModalBottomSheetWidget extends StatefulWidget {
  const ModalBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheetWidget> createState() => _ModalBottomSheetWidgetState();
}

class _ModalBottomSheetWidgetState extends State<ModalBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    final modalBottomSheetProvider = Provider.of<ModalBottomSheetProvider>(context,listen: true);
    return Align(
      alignment: Alignment.bottomRight,
      child: IconButton(icon: Icon(Icons.add), onPressed: () {
        showModalBottomSheet(
          context: context, builder: (_) {
          return SafeArea(
            child: Container(
              color: BACKGROUND_COLOR,
            height: 160.h,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.cyanAccent),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text("메모하기"),
                    onTap: (){
                      context.pop();
                      showModalBottomSheet(context: context, builder: (_){
                        return Container(
                          height: 400.h,
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(top:10.h),
                            alignment: Alignment.center,
                            height: 200.h,
                            child:Column(
                              children: [
                                Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:  const [
                                    Text('시작시간',style: TextStyle(color: Colors.cyan),),
                                    Text('마감시간',style: TextStyle(color: Colors.cyan),)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                              InkWell(
                                                onTap:() =>  modalBottomSheetProvider.startShowPicker(context),
                                                child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1,color: Colors.cyan), color: BACKGROUND_COLOR,),
                                        width: 200,
                                        height: 50,
                                        child: Text(modalBottomSheetProvider.startSelectedTime.toString(),style: TextStyle(color: Colors.black,fontSize: 14.sp),textAlign: TextAlign.center,),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: ()  => modalBottomSheetProvider.finalShowPicker(context),
                                      child: Container(
                                        decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.cyan), color: BACKGROUND_COLOR,),
                                        width: 200,
                                        height: 50,
                                        child: Text(modalBottomSheetProvider.finalSelectedTime,style: TextStyle(color: Colors.black,fontSize: 14.sp,),textAlign: TextAlign.center,),
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10.w),
                                  alignment: Alignment.center,
                                  child:  Text("메모하기",style: TextStyle(color: Colors.cyan),),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10,0,10,0),
                                  height: 150.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1,color: Colors.cyan),
                                    color: BACKGROUND_COLOR,
                                  ),
                                child: CustomTextFieldForm(
                                  key: modalBottomSheetProvider.memoFormKey,
                                  controller: modalBottomSheetProvider.memoController,
                                  onChanged: (value) => modalBottomSheetProvider.memoChanged(value),
                                  hintText: "메모를 입력해주세요",
                                  validator: (value) => modalBottomSheetProvider.memoValidate(value),
                                ),
                          ),
                                   Container(
                                     width: double.infinity,
                                     height: 50.h,
                                     child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: modalBottomSheetProvider.colorSelect.length,
                                         itemBuilder: (context,index){
                                            return InkWell(
                                              onTap:() => modalBottomSheetProvider.colorValue(index),
                                              child: Container(
                                                width: 35.w,
                                                height: 35.h,
                                                margin: EdgeInsets.all(10.h),
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: 3,color: Colors.black),
                                                  shape: BoxShape.circle,
                                                  color: modalBottomSheetProvider.colorSelect[index]
                                                ),
                                                child: Container(),
                                              ),
                                            );

                                     }),
                                   )
                                    ,TextButton(
                                    onPressed: () => modalBottomSheetProvider.dataSave(context), child: Text("확인")),

                              ],
                            ),

                          ),
                        );
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.cyanAccent),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.color_lens),
                    title: Text('색상변경'),
                    onTap: (){},
                  ),
                ),
              ],
            ),
          ),
          );
        },
        );
      },),
    );
  }
}
