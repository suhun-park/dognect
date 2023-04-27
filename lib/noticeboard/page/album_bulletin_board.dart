import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlbumBulletinBoardScreen extends StatelessWidget {
  const AlbumBulletinBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 20, //item 개수
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1/0.7, //item 의 가로 1, 세로 2 의 비율

        ),
        itemBuilder: (BuildContext context, int index) {
          //item 의 반목문 항목 형성
          return Container(
            child: InkWell(
              onTap: (){},
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/img/dog.jpeg"),
                      ),
                    ),
                    height: 200.h,
                    width: double.infinity,
                    margin: EdgeInsets.all(10.w),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.w),
                          child: Text(
                            '우리 강아지 이쁘죠? 우리 강아지는 매력 넘치고 활기찬 강아지에요',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
