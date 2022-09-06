import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/widget/scrollBar/custom_scrollbar.dart';

class CustomDataTable extends StatelessWidget {
final List<dynamic> dataList;
final List<DataColumn> columns;
final List<DataRow> rows;
const CustomDataTable({Key? key,required this.dataList,required this.columns,required this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DataTable(
      headingTextStyle:const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold),
      dataTextStyle: TextStyle(
          color: ColorConstants.instance.customBlueColor,
          fontWeight: FontWeight.bold),
      showCheckboxColumn: false,
      columnSpacing: 10,
      headingRowHeight: 50,
     // minWidth: MediaQuery.of(context).size.width,
      horizontalMargin: 12,
      showBottomBorder: true,
      columns: columns,
      rows:rows,

    );
  }
}
