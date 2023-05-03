import 'package:dognect/common/data/color.dart';
import 'package:dognect/noticeboard/page/freeboard/common/item.dart';
import 'package:dognect/noticeboard/page/freeboard/provider/free_board_write_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FreeBoardDropdown extends StatefulWidget {
  const FreeBoardDropdown({Key? key}) : super(key: key);

  @override
  State<FreeBoardDropdown> createState() => _FreeBoardDropdownState();
}

class _FreeBoardDropdownState extends State<FreeBoardDropdown> {
  @override
  Widget build(BuildContext context) {
    final List<String> dropDownItem = items;
    final freeBoardWriteProvider = Provider.of<FreeBoardWriteProvider>(context);
    String? check;
    return DropdownButtonHideUnderline(
        child: SizedBox(
      width: double.infinity,
      child: DropdownButton2(
        hint: Text("카테고리를 입력해주세요"),
        items: dropDownItem
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                  ),
                ))
            .toList(),
        value: freeBoardWriteProvider.dropDownItemSelected,
        onChanged: (value) => freeBoardWriteProvider.dropdownSelectedFunction(value),
        buttonStyleData: ButtonStyleData(
          height: 50.h,
          width: 160.w,
          elevation: 2,
        ),
        dropdownStyleData: DropdownStyleData(
            maxHeight: 200.h,
            width: double.infinity,
            padding: null,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: BACKGROUND_COLOR,
            ),
            elevation: 8,
            offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            )),
        menuItemStyleData:  MenuItemStyleData(
          height: 40.h,
          padding: EdgeInsets.only(left: 14.w, right: 14.w),
        ),
      ),
    ));
  }
}
