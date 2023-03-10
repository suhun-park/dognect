import 'package:dognect/user/login/model/role_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../common/data/color.dart';
import '../../provider/role_provider.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final getData = Provider.of<RoleProvider>(context, listen: true);
    final customWidth = MediaQuery.of(context).size.width;
    final customHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: getData.roleDataGet(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("다시 접속해주세요");
          } else if (snapshot.hasData) {
            return Container(
              alignment: Alignment.center,
              width: customWidth * 0.8,
              height: customHeight * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: BACKGROUND_COLOR,
                border: Border.all(),
              ),
              child: DropdownButton<String>(
                value: getData.dropDownValue.toString(),
                items: getData.roleData
                    .map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) => getData.dropDownValueChange(value),
                style: const TextStyle(color: Colors.black, fontSize: 40),
                itemHeight: customHeight * 0.1,
                iconSize: 0,
                dropdownColor: BACKGROUND_COLOR,
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
