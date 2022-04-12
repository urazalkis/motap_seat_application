import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/text_format/date_format.dart';
import 'package:motaperp_seat_application/core/widget/date_time_picker/date_picker.dart';
import 'package:motaperp_seat_application/core/widget/drop_down_button/dropdown_search_button.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/core/widget/popup_menu_button/custom_popup_menu_button.dart';
import 'package:motaperp_seat_application/core/widget/table/custom_data_table.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_field_standard.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:motaperp_seat_application/view/reports/current/current_cubit.dart';
import 'package:motaperp_seat_application/view/reports/current/current_state.dart';
import 'package:motaperp_seat_application/view/reports/orderReport/order_report_cubit.dart';
import 'package:motaperp_seat_application/view/reports/orderReport/order_report_state.dart';
import 'package:provider/provider.dart';


class OrderReportView extends StatefulWidget {
  const OrderReportView({Key? key}) : super(key: key);

  @override
  _OrderReportViewState createState() => _OrderReportViewState();
}

class _OrderReportViewState extends State<OrderReportView> {
  String appBarTitle = "Sipariş Raporu";


  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
   context.read<CurrentCubit>().getCurrent();
   context.read<OrderReportCubit>().getOrderList("");
    super.initState();
  }
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    BaseReportViewModel baseReportViewModel = context.watch<BaseReportViewModel>();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: ColorConstants.instance.appBackgroundColor,
        ),
        leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {baseReportViewModel.navigateToBack();},),
        title: baseReportViewModel.isSearching == false ?
    Text(appBarTitle,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
            :
            TextFieldStandard(
              hintText: "Model,müşteri adı,kombinasyon arayın",
              onChanged: (searchResult){
                baseReportViewModel.searchedData = searchResult;

                if(baseReportViewModel.selectedDateMin==null||baseReportViewModel.selectedDateMax==null){context.read<OrderReportCubit>().searchData(baseReportViewModel.selectedData,baseReportViewModel.searchedData);}
                else{context.read<OrderReportCubit>().searchDataWithFilter(baseReportViewModel.selectedData, baseReportViewModel.searchedData, baseReportViewModel.selectedDateMin.toString(), baseReportViewModel.selectedDateMax.toString());}

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
                    ToastMessage.instance.errorMessage(errorMessage: "Lütfen İlk Önce Cari Seçiniz!");
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
                ToastMessage.instance.errorMessage(errorMessage: "Lütfen İlk Önce Cari Seçiniz!");
              }
              else {
                baseReportViewModel.changeSearchStatus();
                baseReportViewModel.searchedData = "";
                if (baseReportViewModel.selectedDateMin == null ||
                    baseReportViewModel.selectedDateMax == null) {
                  context.read<OrderReportCubit>().getOrderList(
                      baseReportViewModel.selectedData);
                }
                else {
                  context.read<OrderReportCubit>().getOrderListWithFilter(
                      baseReportViewModel.selectedData,
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
                  ToastMessage.instance.errorMessage(errorMessage: "Lütfen İlk Önce Cari Seçiniz!");
                }
                else{
                  context.read<OrderReportCubit>().getOrderListWithFilter(baseReportViewModel.selectedData, baseReportViewModel.selectedDateMin.toString(),baseReportViewModel.selectedDateMax.toString());

                }

              }
              if (menuItemValue == 4) {
                baseReportViewModel.selectedDateMin = null;
                baseReportViewModel.selectedDateMax = null;
                context.read<OrderReportCubit>().getOrderList(baseReportViewModel.selectedData);
              }
            },
          )
        ],
      ),
      body:WillPopScope(
        onWillPop: () => baseReportViewModel.navigateToBack(),
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: BlocBuilder<CurrentCubit,ICurrentState>(
            builder: (context,currentState){
              if(currentState is CurrentLoading)
                {
                  return const CustomCircularProgressIndicator();
                }
              else if(currentState is CurrentLoaded){

                baseReportViewModel.itemIdList?.clear();
                baseReportViewModel.itemNameList?.clear();
                baseReportViewModel.fillDataList(currentState.showList,context.read<BaseReportViewModel>().itemNameList,context.read<BaseReportViewModel>().itemIdList);

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomDropDownSearchButton(
                          itemNameList: baseReportViewModel.itemNameList,
                          selectedItem:baseReportViewModel.selectedData,
                          itemIdList: baseReportViewModel.itemIdList,
                          selectedItemId:baseReportViewModel.getDropdownValueId(context.read<BaseReportViewModel>().selectedData),
                          labelText: "Cari Listesi",
                          validator: false,
                          onChanged: (String? selectedData){
                            baseReportViewModel.selectedData = selectedData;
                            context.read<OrderReportCubit>().getOrderList(selectedData);
                            print(selectedData);
                          },
                          onChangedDataId: (String? selectedDataId){
                            baseReportViewModel.selectedItemId = selectedDataId;
                          },
                      ),

                      BlocBuilder<OrderReportCubit,IOrderReportState>
                        (
                          builder: (context,orderReportState){
                            if(orderReportState is OrderReportLoading)
                            {

                              return const CustomCircularProgressIndicator();

                            }
                           else if(orderReportState is OrderReportLoaded)
                            {

                              return SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CustomDataTable(
                                        dataList: orderReportState.orderList,
                                        columns:const <DataColumn>[
                                          DataColumn2(
                                            label: Text(
                                              "Firma",
                                              maxLines: 3,
                                            ),
                                          ),
                                          DataColumn2(
                                              label: Text("Müşteri Adı",
                                                maxLines: 3,
                                              )
                                          ),
                                          DataColumn2(
                                              label: Text("Model Adı",
                                                maxLines: 3,)
                                          ),
                                          DataColumn2(
                                              label: Text("Türü",
                                                maxLines: 3,)
                                          ),
                                          DataColumn2(
                                              label: Text("Sipariş T.",
                                               maxLines: 3,)
                                          ),
                                          DataColumn2(
                                              label: Text("Teslimat T.",
                                               maxLines: 3,)
                                          ),

                                          DataColumn2(
                                              label: Text("Yazdırma",
                                                 maxLines: 3,)
                                          ),
                                          DataColumn2(
                                              label: Text("Sistem No",maxLines: 3,)
                                          ),
                                         /* DataColumn2(
                                              label: Text("Detay",maxLines: 3,)
                                          )*/
                                        ],
                                      rows: List<DataRow>.generate(
                                          orderReportState.orderList.length,
                                              (index) =>
                                              DataRow(
                                                  onSelectChanged: (a) {
                                                    print("tıklandı");
                                                  },
                                                  cells: [
                                                    DataCell(Text(
                                                        "${orderReportState.orderList[index]
                                                            .title}"),),
                                                    DataCell(Text(
                                                        "${orderReportState.orderList[index]
                                                            .customerName}"),),
                                                    DataCell(Text(
                                                        "${orderReportState.orderList[index]
                                                            .modelName}")),
                                                    DataCell(Text(
                                                        "${orderReportState.orderList[index].type}")),
                                                    DataCell(Text(
                                                        "${orderReportState.orderList[index]
                                                            .orderDate}")),
                                                    DataCell(Text(
                                                        "${orderReportState.orderList[index]
                                                            .deliveryDate}")),
                                                    DataCell(Text(
                                                        "${orderReportState.orderList[index]
                                                            .label}")),
                                                    DataCell(Text(
                                                        "${orderReportState.orderList[index]
                                                            .systemNo}")),
                                                 /*   DataCell(
                                                      DetailPopupMenuButton(
                                                        itemBuilder:  (context) =>
                                                        [
                                                          PopupMenuItem(
                                                            value: 1,
                                                            child: TextButton.icon(

                                                              icon:const Icon(Icons.search),
                                                              label:Text('Detay Görüntüle',
                                                              style:TextStyle(color:ColorConstants.instance.customBlueColor)),
                                                              onPressed: () {

                                                              }
                                                            ),
                                                          ),
                                                          ]

                                                      ),
                                                    )*/
                                                  ]
                                              )
                                      ),
                                    ),
                                  ],
                                ),
                              );

                            }
                            else if(orderReportState is OrderReportError)
                            {

                              ToastMessage.instance.errorMessage(errorMessage:orderReportState.errorMessage);
                              return const Center();

                            }
                            else{
                              return const Center();
                            }
                          }
                      )
                  ],
                  ),
                );
              }
              else if(currentState is CurrentError)
              {
                ToastMessage.instance.errorMessage(errorMessage:currentState.errorMessage);
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
    );
  }
}
