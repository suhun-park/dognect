import 'package:dognect/common/view/root_tab.dart';
import 'package:dognect/home/provider/home_provider.dart';
import 'package:dognect/user/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override

  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserProvider>(context);
    final homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
              Row(
                children: [
                  FutureBuilder<String>(
                      future: homeProvider.getUserImage(context),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text("error");
                        } else if (snapshot.hasData) {
                          return InkWell(
                            onTap: (){} , //수정부분
                            child: Container(
                              margin: EdgeInsets.fromLTRB(40.w, 5.h, 0,0),
                              width: 63.w, height: 63.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(snapshot.data!,
                                    ),
                                  )
                              ),
                            ),
                          );
                        }
                        return CircularProgressIndicator();
                      }),
                  Container(
                    child:Text('안녕하세요, ${userDataProvider.userMyModelData[0].nickName}님 \n ${DateTime.now()}'),
                  )
                ],
              )

            ],
          ),
        ),
      );
      //endDrawer: HomeDrawer()

  }
}


