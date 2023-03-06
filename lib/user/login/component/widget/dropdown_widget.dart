import 'package:dognect/common/color/color.dart';
import 'package:dognect/user/login/controller/dropdown_controller.dart';
import 'package:dognect/user/login/model/role_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;
    Get.put(DropDownController());
      return GetBuilder<DropDownController>(
          init: DropDownController()..roleDataGet(),
          builder: (controller)=>
                Container(
                  alignment: Alignment.center,
                  width: customWidth * 0.5,
                  height: customHeight * 0.1,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      border: Border.all(),
                  ),
                  child:DropdownButton<String>(
                value: controller.dropDownValue,
                items: controller.roleData.map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                  onChanged: (value) => controller.dropDownValueChange(value!),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black,fontSize: 20),
              ),
                ),
      );
    }
}
