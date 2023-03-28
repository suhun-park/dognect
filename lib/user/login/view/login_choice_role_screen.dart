import 'package:dognect/user/login/component/widget/dropdown_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../common/data/color.dart';
import '../provider/role_provider.dart';


class LoginChoiceRoleScreen extends StatelessWidget {
  const LoginChoiceRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<RoleProvider>(context,);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
          child: Center(
            child: Column(
              children:  [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(onPressed: (){context.pop();}, icon: Icon(Icons.arrow_back))),
                SizedBox(
                  height: 20.h,
                ),
                Image.asset('assets/img/splash.png',width: 50.w,height: 50.h),
                SizedBox(
                  height: 80.h,
                ),
                 Container(
                   padding: EdgeInsets.all(80.w),
                   decoration: BoxDecoration(
                     border: Border.all(
                       width: 1.w,
                       color: Colors.black,
                     ),shape: BoxShape.circle,
                   ),
                 child: RichText(
                   textAlign: TextAlign.center,
                   text:  TextSpan(
                     text: '당신은\n',
                     style: TextStyle(
                       fontSize: 40.sp,
                       color: Colors.black,
                     ),
                     children: <TextSpan>[
                       TextSpan(
                         text: '누구',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 50.sp,
                           color: Colors.black,
                         ),
                       ),
                       TextSpan(
                         text: '신가요?',
                         style: TextStyle(
                           fontSize: 40.sp,
                           color: Colors.black,
                         )
                       )
                     ],
                   ),
                 ),
                 ),
                SizedBox(
                  height: 80.h,
                ),
                DropDownWidget(), //dropdownwidget호출
               SizedBox(
                 height: 80.h,
               ),
               Container(
                 width: 100.h,
               child:TextButton(
                   onPressed: () => getData.roleChoice(context),
                   child: Text("확인",style: TextStyle(fontSize: 30.sp),))
               ),
              ],
            ),
          ),
        ),

    );
  }
}
