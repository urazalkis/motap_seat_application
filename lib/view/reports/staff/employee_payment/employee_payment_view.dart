import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:motaperp_seat_application/core/base/view/base_view.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/text_format/date_format.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/date_time_picker/date_picker.dart';
import 'package:motaperp_seat_application/core/widget/drop_down_button/dropdown_search_button.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/core/widget/popup_menu_button/custom_popup_menu_button.dart';
import 'package:motaperp_seat_application/core/widget/scrollBar/custom_scrollbar.dart';
import 'package:motaperp_seat_application/core/widget/table/custom_data_table.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_field_standard.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:motaperp_seat_application/view/reports/base/staff/staff_cubit.dart';
import 'package:motaperp_seat_application/view/reports/base/staff/staff_state.dart';
import 'package:motaperp_seat_application/view/reports/staff/employee_payment/employee_payment_response.dart';
import 'package:provider/provider.dart';

import 'employee_payment_cubit.dart';
import 'employee_payment_state.dart';
class EmployeePaymentView extends StatefulWidget {
  const EmployeePaymentView({Key? key}) : super(key: key);

  @override
  _EmployeePaymentViewState createState() => _EmployeePaymentViewState();
}

class _EmployeePaymentViewState extends State<EmployeePaymentView> {

  @override
  Widget build(BuildContext context) {
    BaseReportViewModel baseReportViewModel = context.watch<BaseReportViewModel>();
    return BaseView<EmployeePaymentCubit>
      (
        viewModel: EmployeePaymentCubit(),
      init: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
        context.read<StaffCubit>().getStaffList();
        context.read<EmployeePaymentCubit>().getEmployeePaymentList("");
      },
      dispose: (viewModel){
          context.portraitUpView;
          baseReportViewModel.clear();

      },
        onPageBuilder:(BuildContext context, EmployeePaymentCubit viewModel) => Scaffold(
          appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: ColorConstants.instance.appBackgroundColor,
          ),
          leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
          title: baseReportViewModel.isSearching == false ?
          const Text("Personel Hakediş",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              :
          TextFieldStandard(
            hintText: "Müşteri Adı,Model Adı,Takım Türü arayın",
            onChanged: (searchResult){
              baseReportViewModel.searchedData = searchResult;
              if(baseReportViewModel.selectedDateMin==null||baseReportViewModel.selectedDateMax==null){context.read<EmployeePaymentCubit>().searchData(baseReportViewModel.selectedData,baseReportViewModel.searchedData);}
              else{context.read<EmployeePaymentCubit>().searchDataWithFilter(baseReportViewModel.selectedData,baseReportViewModel.searchedData, baseReportViewModel.selectedDateMin.toString(), baseReportViewModel.selectedDateMax.toString());}

            },
          ),
          actions: [

            baseReportViewModel.isSearching == false
                ?
            IconButton(
              tooltip: "Arama Yapın",
              icon: const Icon(Icons.search, color: Colors.white,),
              onPressed: () {
                if(baseReportViewModel.selectedData==null){
                  ToastMessage.instance.errorMessage(errorMessage: "Lütfen İlk Önce Personel Seçiniz!");
                }
                else {
                  baseReportViewModel.changeSearchStatus();
                }
              },
            ):
            IconButton(
              icon: const Icon(Icons.cancel, color: Colors.white,),
              onPressed: () {
                if(baseReportViewModel.selectedData==null){
                  ToastMessage.instance.errorMessage(errorMessage: "Lütfen İlk Önce Personel Seçiniz!");
                }
                else {
                  baseReportViewModel.changeSearchStatus();
                  baseReportViewModel.searchedData = "";
                  if (baseReportViewModel.selectedDateMin == null ||
                      baseReportViewModel.selectedDateMax == null) {
                    context.read<EmployeePaymentCubit>().getEmployeePaymentList(baseReportViewModel.selectedData);
                  }
                  else {
                    context.read<EmployeePaymentCubit>().getEmployeePaymentFilter(baseReportViewModel.selectedData,
                        baseReportViewModel.selectedDateMin.toString(),
                        baseReportViewModel.selectedDateMax.toString());
                  }
                }

              },
            ),
            CustomPopupMenuButton(
              toolTip: "Filtrele",
              icon: const Icon(Icons.filter_list, color: Colors.white,),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    baseReportViewModel.selectedDateMin==null ? 'Minimum Tarihi Seçiniz' : "${DateFormatter.instance.formatter.format(baseReportViewModel.selectedDateMin!)} Tarihinden",
                    style: TextStyle(color:ColorConstants.instance.customBlueColor),
                  ),

                ),
                PopupMenuItem(
                  value: 2,
                  child: Text(
                    baseReportViewModel.selectedDateMax==null ? 'Max Tarihi Seçiniz' : "${DateFormat("yyyy-MM-dd").format(baseReportViewModel.selectedDateMax!)} Tarihine",
                    style: TextStyle(color:ColorConstants.instance.customBlueColor),
                  ),

                ),
                const PopupMenuItem(
                  value: 3,
                  child:Text("Filtreyi Uygula",style: TextStyle(color: Colors.green)),),
                const PopupMenuItem(
                  value: 4,
                  child: Text("Tümünü Temizle",style: TextStyle(color: Colors.blue)),
                ),
              ],
              onSelected: (menuItemValue){
                if (menuItemValue == 1) {
                  DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      theme: CustomDatePicker.instance.datePickerTheme,
                      onConfirm: (date) {
                        print('confirm max ${date}');

                        baseReportViewModel.selectedDateMin = date;

                        print(baseReportViewModel.selectedDateMin);

                      },
                      currentTime: baseReportViewModel.selectedDateMin,
                      locale: LocaleType.tr
                  );
                }
                if (menuItemValue == 2) {
                  DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      theme: CustomDatePicker.instance.datePickerTheme,
                      onConfirm: (date) {
                        print('confirm max ${date}');

                        baseReportViewModel.selectedDateMax = date;
                        print(baseReportViewModel.selectedDateMax);

                      },
                      currentTime:baseReportViewModel.selectedDateMax,
                      locale: LocaleType.tr
                  );
                }
                if (menuItemValue == 3) {
                  if(baseReportViewModel.selectedData==null){
                    ToastMessage.instance.errorMessage(errorMessage: "Lütfen İlk Önce Personel Seçiniz!");
                  }
                  else{
                    context.read<EmployeePaymentCubit>().getEmployeePaymentFilter(baseReportViewModel.selectedData,baseReportViewModel.selectedDateMin.toString(),baseReportViewModel.selectedDateMax.toString());

                  }

                }
                if (menuItemValue == 4) {
                  baseReportViewModel.selectedDateMin = null;
                  baseReportViewModel.selectedDateMax = null;
                  context.read<EmployeePaymentCubit>().getEmployeePaymentList(baseReportViewModel.selectedData);
                }
              },
            )
          ],
        ),
          body:WillPopScope(
            onWillPop: () => NavigationService.instance.returnBack(context),
            child: SizedBox(
              height: context.screenHeight,
              width: context.screenWidth,
              child: BlocBuilder<StaffCubit,IStaffState>(
                  builder: (context,staffState){
                    if(staffState is StaffLoading)
                    {
                      return const CustomCircularProgressIndicator();
                    }
                    else if(staffState is StaffLoaded){

                      baseReportViewModel.itemIdList = [];
                      baseReportViewModel.itemNameList = [];
                      baseReportViewModel.fillStaffList(staffState.myList,context.read<BaseReportViewModel>().itemNameList,context.read<BaseReportViewModel>().itemIdList);
                       return Column(
                         children: [
                           CustomDropDownSearchButton(
                             itemNameList: baseReportViewModel.itemNameList,
                             selectedItem:baseReportViewModel.selectedData,
                             itemIdList: baseReportViewModel.itemIdList,
                             selectedItemId:baseReportViewModel.getDropdownValueId(context.read<BaseReportViewModel>().selectedData),
                             labelText: "Personel Listesi",
                             validator: false,
                             onChanged: (String? selectedData){
                               baseReportViewModel.selectedData = selectedData;
                               context.read<EmployeePaymentCubit>().getEmployeePaymentList(selectedData);
                               print(selectedData);
                             },
                             onChangedDataId: (String? selectedDataId){
                               baseReportViewModel.selectedItemId = selectedDataId;
                             },
                           ),
                           BlocBuilder<EmployeePaymentCubit,IEmployeePaymentState>
                             (
                               builder: (context,employeePaymentState){
                                 if(employeePaymentState is EmployeePaymentLoading)
                                 {

                                   return const CustomCircularProgressIndicator();

                                 }
                                 else if(employeePaymentState is EmployeePaymentLoaded)
                                 {
                                   return Flexible(
                                     child: CustomScrollBar(
                                       child: ListView(
                                         shrinkWrap: true,
                                         children:[
                                           SingleChildScrollView(
                                             scrollDirection: Axis.horizontal,
                                             child: SingleChildScrollView(
                                               scrollDirection: Axis.vertical,
                                               child: CustomDataTable(
                                                 dataList: employeePaymentState.myList ?? [],
                                                 columns:const <DataColumn>[
                                                   DataColumn(
                                                     label: Text(
                                                       "İşçi Ad",
                                                       maxLines: 3,
                                                     ),
                                                   ),
                                                   DataColumn(
                                                       label: Text("Müşteri Adı",
                                                         maxLines: 3,
                                                       )
                                                   ),
                                                   DataColumn(
                                                       label: Text("Model Adı",
                                                         maxLines: 3,)
                                                   ),
                                                   DataColumn(
                                                       label: Text("Tür",
                                                         maxLines: 3,)
                                                   ),
                                                   DataColumn(
                                                       label: Text("Ücret",
                                                         maxLines: 3,)
                                                   ),
                                                   DataColumn(
                                                       label: Text("Ücret T.",
                                                         maxLines: 3,)
                                                   ),

                                                   DataColumn(
                                                       label: Text("Ünvan",
                                                         maxLines: 3,)
                                                   ),
                                                   DataColumn(
                                                       label: Text("Sipariş No",maxLines: 3,)
                                                   ),
                                                   DataColumn(
                                                       label: Text("İşçi TC No",maxLines: 3,)
                                                   ),
                                                   DataColumn(
                                                       label: Text("Açıklama",maxLines: 3,)
                                                   ),
                                                 ],
                                                 rows: List<DataRow>.generate(
                                                     employeePaymentState.myList!.length,
                                                         (index) =>
                                                         DataRow(
                                                             onSelectChanged: (a) {
                                                               print("tıklandı");
                                                             },
                                                             cells: [
                                                               DataCell(Text(
                                                                   "${employeePaymentState.myList![index]!
                                                                       .employeeName}"),),
                                                               DataCell(Text(
                                                                   "${employeePaymentState.myList![index]!
                                                                       .customerName}"),),
                                                               DataCell(Text(
                                                                   "${employeePaymentState.myList![index]!
                                                                       .modelName}")),
                                                               DataCell(Text(
                                                                   "${employeePaymentState.myList![index]!.type}")),
                                                               DataCell(Text(
                                                                   "${employeePaymentState.myList![index]!
                                                                       .payment}")),
                                                               DataCell(Text(
                                                                   "${employeePaymentState.myList![index]!
                                                                       .paymentDate}")),
                                                               DataCell(Text(
                                                                   "${employeePaymentState.myList![index]!
                                                                       .title}")),
                                                               DataCell(Text(
                                                                   "${employeePaymentState.myList![index]!
                                                                       .orderNo}")),
                                                               DataCell(Text(
                                                                   "${employeePaymentState.myList![index]!
                                                                       .tc}")),
                                                               DataCell(Text(
                                                                   "${employeePaymentState.myList![index]!
                                                                       .explanation}")),

                                                             ]
                                                         )
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ],

                                       ),
                                     ),
                                   );

                                 }
                                 else if(employeePaymentState is EmployeePaymentError)
                                 {

                                   ToastMessage.instance.errorMessage(errorMessage:employeePaymentState.errorMessage);
                                   return const Center();

                                 }
                                 else{
                                   return const Center();
                                 }
                               }
                           )
                         ],
                       );
                    }
                    else if(staffState is StaffError)
                    {
                      ToastMessage.instance.errorMessage(errorMessage:staffState.errorMessage);
                      return const Center();

                    }
                    else
                    {
                      ToastMessage.instance.errorMessage();
                      return const Center();

                    }

                  }
              ),
            ),
          ),
    ),
    );
  }
}
