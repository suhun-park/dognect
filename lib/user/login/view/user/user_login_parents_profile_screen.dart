import 'dart:io';
import 'package:dognect/user/login/component/layout/sign_up_text_form.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import '../../../../common/data/color.dart';
import '../../provider/user/user_login_parents_profile_provider.dart';

class UserLoginParentsProfileScreen extends StatelessWidget {
  const UserLoginParentsProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<UserLoginParentsProfileProvider>(context);
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(onPressed: (){context.pop();}, icon: Icon(Icons.arrow_back))),
                Image.asset('assets/img/splash.png',width: customWidth * 0.1,height: customHeight * 0.1),
                SizedBox(
                  height: customHeight * 0.05,
                ),
                Text(
                  '프로필 설정',
                  style: TextStyle(fontSize: 50),
                ),
                SizedBox(
                  height: customHeight * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => getData.imageChange(),
                      child: Container(
                        width: customWidth * 0.3,
                        height: customWidth * 0.3,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: getData.imageFile != null
                              ? DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(getData.imageFile!.path)),
                          )
                              : null,
                        ),
                        child: getData.imageFile == null
                            ? Icon(
                          Icons.account_circle,
                          size: customWidth * 0.3,
                        )
                            : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: customHeight * 0.1,
                ),
                SizedBox(
                  width: customWidth * 0.5,
                  child: SignUpTextForm(
                    onChanged: (value) => getData.nickNameController(value) ,
                    hintText: '닉네임을 입력해주세요',
                    globalKey: getData.parentsNickNameKey,
                    validator: (value) =>getData.nickNameValidate(value),
                  ),
                ),
                SizedBox(
                  height: customHeight * 0.20,
                ),
                TextButton(
                  onPressed: () => getData.checkFunction(context),
                  child: Text(
                    '확인',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}