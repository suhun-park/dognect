import 'package:dognect/user/login/component/widget/dropdown_widget.dart';
import 'package:dognect/user/login/view/login_parents_profile_screen.dart';
import 'package:dognect/user/login/view/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../common/data/color.dart';
import '../provider/role_provider.dart';


class LoginChoiceRoleScreen extends StatelessWidget {
  const LoginChoiceRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;
    final getData = Provider.of<RoleProvider>(context,);
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
          child: Center(
            child: Column(
              children:  [
                Image.asset('assets/img/splash.png',width: customWidth * 0.1,height: customHeight * 0.1),
                SizedBox(
                  height: customHeight * 0.05,
                ),
                 Container(
                   padding: EdgeInsets.all(80),
                   decoration: BoxDecoration(
                     border: Border.all(
                       width: 1,
                       color: Colors.black,
                     ),shape: BoxShape.circle,
                   ),
                 child: RichText(
                   textAlign: TextAlign.center,
                   text: const TextSpan(
                     text: '당신은\n',
                     style: TextStyle(
                       fontSize: 40,
                       color: Colors.black,
                     ),
                     children: <TextSpan>[
                       TextSpan(
                         text: '누구',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 50,
                           color: Colors.black,
                         ),
                       ),
                       TextSpan(
                         text: '신가요?',
                         style: TextStyle(
                           fontSize: 40,
                           color: Colors.black,
                         )
                       )
                     ],
                   ),
                 ),
                 ),
                SizedBox(
                  height: customHeight * 0.15,
                ),
                DropDownWidget(), //dropdownwidget호출
               SizedBox(
                 height: customHeight * 0.15,
               ),
               Container(
                 width: customHeight * 0.15,
               child:TextButton(
                   onPressed: () => getData.roleChoice(context),
                   child: Text("확인",style: TextStyle(fontSize: 30),))
               ),
              ],
            ),
          ),
        ),

    );
  }
}
