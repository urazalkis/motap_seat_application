import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:motaperp_seat_application/core/base/view/base_view.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/text_format/date_format.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/appBar/rounded_rectangle_app_bar.dart';
import 'package:motaperp_seat_application/core/widget/date_time_picker/date_picker.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/core/widget/popup_menu_button/custom_popup_menu_button.dart';
import 'package:motaperp_seat_application/core/widget/scrollBar/custom_scrollbar.dart';
import 'package:motaperp_seat_application/core/widget/table/custom_data_table.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_field_standard.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:provider/provider.dart';
import 'working_hour_cubit.dart';
import 'working_hour_state.dart';
class WorkingHourView extends StatefulWidget {
  const WorkingHourView({Key? key}) : super(key: key);

  @override
  _WorkingHourViewState createState() => _WorkingHourViewState();
}

class _WorkingHourViewState extends State<WorkingHourView> {

  @override
  Widget build(BuildContext context) {
    BaseReportViewModel baseReportViewModel = context.watch<BaseReportViewModel>();
    return BaseView<WorkingHourCubit>
      (
        viewModel: WorkingHourCubit(),
      init: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
        context.read<WorkingHourCubit>().getWorkingHourList();
      },
      dispose: (viewModel){
          context.portraitUpView;
          baseReportViewModel.clear();

      },
        onPageBuilder:(BuildContext context, WorkingHourCubit viewModel) => Scaffold(
          appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: ColorConstants.instance.appBackgroundColor,
          ),
          leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
          title: baseReportViewModel.isSearching == false ?
          const Text("Çalışma Saatleri",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              :
          TextFieldStandard(
            hintText: "Herhangi Bir Şey arayın",
            onChanged: (searchResult){
              baseReportViewModel.searchedData = searchResult;
              if(baseReportViewModel.selectedDateMin==null||baseReportViewModel.selectedDateMax==null){context.read<WorkingHourCubit>().searchData(baseReportViewModel.searchedData);}
              else{context.read<WorkingHourCubit>().searchDataFilter(baseReportViewModel.selectedDateMin.toString(), baseReportViewModel.selectedDateMax.toString(),baseReportViewModel.searchedData);}

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
                    context.read<WorkingHourCubit>().getWorkingHourList();
                  }
                  else {
                    context.read<WorkingHourCubit>().getWorkingHourListFilter(
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
                    context.read<WorkingHourCubit>().getWorkingHourListFilter(baseReportViewModel.selectedDateMin.toString(),baseReportViewModel.selectedDateMax.toString());


                }
                if (menuItemValue == 4) {
                  baseReportViewModel.selectedDateMin = null;
                  baseReportViewModel.selectedDateMax = null;
                  context.read<WorkingHourCubit>().getWorkingHourList();
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
              child:BlocBuilder<WorkingHourCubit,IWorkingHourState>
                (
                  builder: (context,workingHourState){
                    if(workingHourState is WorkingHourLoading)
                    {

                      return const CustomCircularProgressIndicator();

                    }
                    else if(workingHourState is WorkingHourLoaded)
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
                                  dataList: workingHourState.myList,
                                  columns:const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        "Adı",
                                        maxLines: 3,
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text("Tarih",
                                          maxLines: 3,
                                        )
                                    ),
                                    DataColumn(
                                      label: Text(
                                        "Gün",
                                        maxLines: 3,
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text("Giriş Saati",
                                          maxLines: 3,
                                        )
                                    ),
                                    DataColumn(
                                        label: Text("Çıkış Saati",
                                          maxLines: 3,
                                        )
                                    ),

                                  ],
                                  rows: List<DataRow>.generate(
                                      workingHourState.myList.length,
                                          (index) =>
                                          DataRow(
                                              onSelectChanged: (a) {
                                                print("tıklandı");
                                              },
                                              cells: [
                                                DataCell(Text(
                                                    "${workingHourState.myList[index]
                                                        .personalName}"),),
                                                DataCell(Text(
                                                    "${workingHourState.myList[index]
                                                        .entryDate}"),),
                                                DataCell(Text(
                                                    "${workingHourState.myList[index]
                                                        .day}"),),
                                                DataCell(Text(
                                                    "${workingHourState.myList[index]
                                                        .entryHour}"),),
                                                DataCell(Text(
                                                    "${workingHourState.myList[index]
                                                        .exitHour}"),),
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
                    else if(workingHourState is WorkingHourError)
                    {

                      ToastMessage.instance.errorMessage(errorMessage:workingHourState.errorMessage);
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

