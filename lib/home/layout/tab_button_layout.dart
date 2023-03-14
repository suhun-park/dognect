import 'package:dognect/home/provider/tab_button_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common/data/color.dart';

class TabButtonLayout extends StatelessWidget {
  const TabButtonLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabButtonProvider = Provider.of<TabButtonProvider>(context);
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      height: 40.h,
      width: 170.w,
      decoration: BoxDecoration(
        color: BOTTOMNAVIGATION_COLOR.withOpacity(1.0),
        border: Border.all(width: 1.w),
        borderRadius: const BorderRadius.all(Radius.circular(40))
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async=> tabButtonProvider.oneTabIndex(),
            child: Container(
              width: 80.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: tabButtonProvider.tabButtonIndex == 0 ? Colors.white : BOTTOMNAVIGATION_COLOR,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text('Event', style: TextStyle(color: tabButtonProvider.tabButtonIndex == 0 ? BOTTOMNAVIGATION_COLOR : Colors.white),),
              ),
            ),
          ),
          InkWell(
            onTap: () async=> tabButtonProvider.twoTabIndex(),
            child: Container(
              width: 80.w,
              height: 32.h,
              decoration: BoxDecoration(
                color:tabButtonProvider.tabButtonIndex == 1 ? Colors.white : BOTTOMNAVIGATION_COLOR ,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Text("SHOP", style: TextStyle(color:tabButtonProvider.tabButtonIndex == 1 ? BOTTOMNAVIGATION_COLOR : Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
