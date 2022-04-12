import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';

class CustomDataTable extends StatelessWidget {
final List<dynamic> dataList;
final List<DataColumn> columns;
final List<DataRow> rows;
const CustomDataTable({Key? key,required this.dataList,required this.columns,required this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DataTable2(
      headingTextStyle:const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold),
      dataTextStyle: TextStyle(
          color: ColorConstants.instance.customBlueColor,
          fontWeight: FontWeight.bold),
      showCheckboxColumn: false,
      columnSpacing: 5,
      headingRowHeight: 50,
      minWidth: MediaQuery.of(context).size.width,
      horizontalMargin: 12,
      showBottomBorder: true,
      columns: columns,
      rows:rows,

    );
  }
}
