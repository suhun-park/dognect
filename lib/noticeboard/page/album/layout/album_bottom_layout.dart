import 'package:dognect/common/page/calendar/widget/modal_bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlbumBottomLayout extends StatelessWidget {
  const AlbumBottomLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return Container(
              width: double.infinity,
              height: 300.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h,),
                  Text("글쓰기",style: TextStyle(fontSize: 20.sp),),
                  SizedBox(height: 10.h,),
                  Divider(color: Colors.black,height: 1.h,),
                  GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      leading: Icon(Icons.add_box_outlined,color: Colors.blue,size: 40.sp,),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      title: Text("사진"),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Divider(color: Colors.black,height: 1.h,),
                  GestureDetector(
                    onTap: (){},
                    child: ListTile(
                      leading: Icon(Icons.video_library_outlined,color: Colors.blue,size: 40.sp,),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      title: Text("동영상"),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Divider(color: Colors.black,height: 1.h,),
                ],
              ),
            );
          },
        );
      },
      backgroundColor: Colors.cyan,
      child: Icon(
        Icons.add_box_outlined,
        size: 35.sp,
      ),
    );
  }
}
