import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:motaperp_seat_application/core/base/view/base_view.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/text_format/date_format.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/date_time_picker/date_picker.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/core/widget/popup_menu_button/custom_popup_menu_button.dart';
import 'package:motaperp_seat_application/core/widget/scrollBar/custom_scrollbar.dart';
import 'package:motaperp_seat_application/core/widget/table/custom_data_table.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_field_standard.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_cubit.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_response.dart';
import 'package:motaperp_seat_application/view/reports/manufacture/plannig/planning_state.dart';
import 'package:provider/provider.dart';

class PlanningView extends StatefulWidget {
  const PlanningView({Key? key}) : super(key: key);

  @override
  _PlanningViewState createState() => _PlanningViewState();
}

class _PlanningViewState extends State<PlanningView> {

  @override
  Widget build(BuildContext context) {
    BaseReportViewModel baseReportViewModel = context.watch<BaseReportViewModel>();
    return BaseView<PlanningCubit>
      (
        viewModel: PlanningCubit(),
        init: (viewModel) {
          viewModel.setContext(context);
          viewModel.init();
          context.read<PlanningCubit>().getList();
        },
        dispose: (viewModel){
          context.portraitUpView;
          baseReportViewModel.clear();

        },
        onPageBuilder:(BuildContext context, PlanningCubit viewModel) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            flexibleSpace: Container(
              decoration: ColorConstants.instance.appBackgroundColor,
            ),
            leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
            title: baseReportViewModel.isSearching == false ?
            const Text("Planlama Listesi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                :
            TextFieldStandard(
              hintText: "Model,Koltuk Türü Arayın",
              onChanged: (searchResult){
                baseReportViewModel.searchedData = searchResult;
                if(baseReportViewModel.selectedDateMin==null||baseReportViewModel.selectedDateMax==null){context.read<PlanningCubit>().searchData(baseReportViewModel.searchedData);}
                else{context.read<PlanningCubit>().searchDataFilter(baseReportViewModel.selectedDateMin.toString(), baseReportViewModel.selectedDateMax.toString(),baseReportViewModel.searchedData);}

              },
            ),
            actions: [

              baseReportViewModel.isSearching == false
                  ?
              IconButton(
                tooltip: "Arama Yapın",
                icon: const Icon(Icons.search, color: Colors.white,),
                onPressed: () {

                  baseReportViewModel.changeSearchStatus();

                },
              ):
              IconButton(
                icon: const Icon(Icons.cancel, color: Colors.white,),
                onPressed: () {

                  baseReportViewModel.changeSearchStatus();
                  baseReportViewModel.searchedData = "";
                  if (baseReportViewModel.selectedDateMin == null ||
                      baseReportViewModel.selectedDateMax == null) {
                    context.read<PlanningCubit>().getList();
                  }
                  else {
                    context.read<PlanningCubit>().getListFilter(
                        baseReportViewModel.selectedDateMin.toString(),
                        baseReportViewModel.selectedDateMax.toString());
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
                      baseReportViewModel.selectedDateMax==null ? 'Max Tarihi Seçiniz' : "${DateFormatter.instance.formatter.format(baseReportViewModel.selectedDateMax!)} Tarihine",
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
                    context.read<PlanningCubit>().getListFilter(baseReportViewModel.selectedDateMin.toString(),baseReportViewModel.selectedDateMax.toString());


                  }
                  if (menuItemValue == 4) {
                    baseReportViewModel.selectedDateMin = null;
                    baseReportViewModel.selectedDateMax = null;
                    context.read<PlanningCubit>().getList();
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
              child:BlocBuilder<PlanningCubit,IPlanningState>
                (
                  builder: (context,planningState){
                    if(planningState is PlanningLoading)
                    {

                      return const CustomCircularProgressIndicator();

                    }
                    else if(planningState is PlanningLoaded)
                    {
                      return CustomScrollBar(
                        child: ListView(
                          shrinkWrap: true,
                          children:[
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: CustomDataTable(
                                  dataList: planningState.myList,
                                  columns:const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        "Ünvan",
                                        maxLines: 3,
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text("Müşteri",
                                          maxLines: 3,
                                        )
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Model",
                                        maxLines: 3,
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text("Kombinasyon",
                                          maxLines: 3,
                                        )
                                    ),
                                    DataColumn(
                                        label: Text("Sipariş T",
                                          maxLines: 3,
                                        )
                                    ),
                                    DataColumn(
                                        label: Text("Teslim T.",
                                          maxLines: 3,
                                        )
                                    ),
                                    DataColumn(
                                        label: Text("Planlama T.",
                                          maxLines: 3,
                                        )
                                    ),


                                  ],
                                  rows: List<DataRow>.generate(
                                      planningState.myList.length,
                                          (index) =>
                                          DataRow(
                                              onSelectChanged: (a) {
                                                print("tıklandı");
                                              },
                                              cells: [
                                                DataCell(Text(
                                                    "${planningState.myList[index]
                                                        .title}"),),
                                                DataCell(Text(
                                                    "${planningState.myList[index]
                                                        .customerName}")),
                                                DataCell(Text(
                                                    "${planningState.myList[index]
                                                        .modelName}")),
                                                DataCell(Text(
                                                    "${planningState.myList[index]
                                                        .combination}")),
                                                DataCell(Text(
                                                    "${planningState.myList[index]
                                                        .orderDate}")),
                                                DataCell(Text(
                                                    "${planningState.myList[index]
                                                        .deliveryDate}")),
                                                DataCell(Text(
                                                    "${planningState.myList[index]
                                                        .planningDate}")),

                                              ]
                                          )
                                  ),
                                ),
                              ),
                            ),
                          ],

                        ),
                      );

                    }
                    else if(planningState is PlanningError)
                    {

                      ToastMessage.instance.errorMessage(errorMessage:planningState.errorMessage);
                      return const Center();

                    }
                    else{
                      return const Center();
                    }
                  }
              ),
            ),
          ),
        )
    );
  }
}

