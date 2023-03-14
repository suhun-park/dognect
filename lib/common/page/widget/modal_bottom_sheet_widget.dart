import 'package:dognect/common/data/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModalBottomSheetWidget extends StatelessWidget {
  const ModalBottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: IconButton(icon: Icon(Icons.add), onPressed: () {
        showModalBottomSheet(
          context: context, builder: (_) {
          return SafeArea(
            child: Container(
              color: BACKGROUND_COLOR,
            height: 200.h,
            width: double.infinity,
            child: Column(
              children: [

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text("글씨 추가하기"),
                    onTap: (){},
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text('색상변경'),
                  onTap: (){},
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
