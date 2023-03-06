import 'package:dognect/user/login/controller/kpostal_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kpostal/kpostal.dart';

class KpostalWidget extends StatelessWidget {
  const KpostalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(KpostalController());
    return GetBuilder<KpostalController>(
        builder: (controller) => Column(children:[
          TextButton(
          onPressed: () async{
            await Get.to<Kpostal>(
              KpostalView(
                useLocalServer: false,
                kakaoKey: '5c27f040a4944296c9d6b5586c9360b2',
                callback: (Kpostal result) => controller.kpostalCallBack(result),
              ),
            );
          },
          child: Icon(Icons.search,size: 14,),
        ),
    ])
    );

  }
}
