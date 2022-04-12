import 'dart:ffi';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:motaperp_seat_application/view/reports/orderReport/order_report_cubit.dart';
import 'package:provider/src/provider.dart';

//typedef VoidCallbackParameter = void Function(String? selectedData,String? selectedItemId,List<String>? itemList,List<String>? itemIdList);
class CustomDropDownSearchButton extends StatefulWidget {
  late List<String>? itemNameList;
  late String? selectedItem;
  late List<String>? itemIdList;
  late String? selectedItemId;
  late String labelText;
  late bool validator;
  late String? validatorText;
  ValueChanged<String?>  onChanged;
  ValueChanged<String?>  onChangedDataId;

  CustomDropDownSearchButton({Key? key, required this.itemNameList,required this.selectedItem,required this.itemIdList,required this.selectedItemId
    ,required this.labelText,required this.validator,this.validatorText,required this.onChanged,required this.onChangedDataId}) : super(key: key);

  @override
  _CustomDropDownSearchButtonState createState() => _CustomDropDownSearchButtonState();
}

class _CustomDropDownSearchButtonState extends State<CustomDropDownSearchButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      mode: Mode.MENU,
      popupBackgroundColor: Colors.white,
      showSearchBox: true,
      searchFieldProps: TextFieldProps(decoration: InputDecoration(
        helperStyle: TextStyle(
            color: ColorConstants.instance.customBlueColor),
        helperText: "Yukarıdan Arama Yapabilirsiniz",
      ),
      ),
      dropdownSearchDecoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorConstants.instance.customBlueColor),
      ),
      items:widget.itemNameList,
      selectedItem:widget.selectedItem,
      onChanged:(String? selectedData) {
        widget.onChanged(selectedData);
       widget.selectedItem = selectedData;
       widget.onChangedDataId(context.read<BaseReportViewModel>().getDropdownValueId(widget.selectedItem));

        },
    );
  }
}
