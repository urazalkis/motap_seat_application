import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/model/base_view_model.dart';
import 'package:motaperp_seat_application/core/constant/design/border_constant.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_field_standard.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:provider/src/provider.dart';

/*class SearchableFilterAppBar<T extends BaseReportViewModel,R extends Cubit> extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  T baseReportViewModel;
  SearchableFilterAppBar({Key? key,required this.baseReportViewModel,this.title, required this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = context.screenHeight;
    return AppBar(
      centerTitle: true,
      shape:RoundedRectangleBorder(
        borderRadius: BorderConstant.instance.radiusAllCircularHigh,
      ),
      flexibleSpace: Container(
        decoration: ColorConstants.instance.appBackgroundColor,
      ),
      leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
      title:baseReportViewModel.isSearching == false ?
       Text(title ?? "",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)    :
      TextFieldStandard(
        hintText: "Herhangi Bir Şey arayın",
        onChanged: (searchResult){
          baseReportViewModel.searchedData = searchResult;
          if(baseReportViewModel.selectedDateMin==null||baseReportViewModel.selectedDateMax==null){context.read<WorkingHourCubit>().searchData(baseReportViewModel.searchedData);}
          else{context.read<R>().searchDataFilter(baseReportViewModel.selectedDateMin.toString(), baseReportViewModel.selectedDateMax.toString(),baseReportViewModel.searchedData);}

        },
      ),
      actions: actions,
    );
  }

/*  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();*/
  final double toolbarHeight=60;
  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}*/
