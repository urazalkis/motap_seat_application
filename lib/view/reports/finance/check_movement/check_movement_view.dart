import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/view/base_view.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/text_format/price_format.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/core/widget/scrollBar/custom_scrollbar.dart';
import 'package:motaperp_seat_application/core/widget/table/custom_data_table.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_field_standard.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:provider/provider.dart';

import 'check_movement_cubit.dart';
import 'check_movement_state.dart';
class CheckMovementView extends StatefulWidget {
  const CheckMovementView({Key? key}) : super(key: key);

  @override
  _CheckMovementViewState createState() => _CheckMovementViewState();
}

class _CheckMovementViewState extends State<CheckMovementView> {

  @override
  Widget build(BuildContext context) {
    BaseReportViewModel baseReportViewModel = context.watch<BaseReportViewModel>();
    return BaseView<CheckMovementCubit>
      (
        viewModel: CheckMovementCubit(),
      init: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
        context.read<CheckMovementCubit>().getCheckMovementList();
      },
      dispose: (viewModel){
          context.portraitUpView;
          baseReportViewModel.clear();

      },
        onPageBuilder:(BuildContext context, CheckMovementCubit viewModel) => Scaffold(
          appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: ColorConstants.instance.appBackgroundColor,
          ),
          leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
          title: baseReportViewModel.isSearching == false ?
          const Text("Çek Hareketi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              :
          TextFieldStandard(
            hintText: "Herhangi Bir Şey Arayın",
            onChanged: (searchResult){
              baseReportViewModel.searchedData = searchResult;
              context.read<CheckMovementCubit>().searchData(baseReportViewModel.searchedData);

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

                    context.read<CheckMovementCubit>().searchData(baseReportViewModel.selectedData);

                }
            ),
          ],
        ),
          body:WillPopScope(
            onWillPop: () => NavigationService.instance.returnBack(context),
            child: SizedBox(
              height: context.screenHeight,
              width: context.screenWidth,
              child:BlocBuilder<CheckMovementCubit,ICheckMovementState>
                (
                  builder: (context,checkMovementState){
                    if(checkMovementState is CheckMovementLoading)
                    {

                      return const CustomCircularProgressIndicator();

                    }
                    else if(checkMovementState is CheckMovementLoaded)
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
                                  dataList: checkMovementState.myList,
                                  columns:const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        "Çek Hareket",
                                        maxLines: 3,
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text("Durum",
                                          maxLines: 3,
                                        )
                                    ),
                                    DataColumn(
                                        label: Text("Döviz",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Banka",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Tutar",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Türü",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Vade T",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Keside Yeri",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Çek Sahibi",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Çek Sahibi TC",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Çek Sistem No",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Sistem No",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Çek No ",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Açıklama",
                                          maxLines: 3,)
                                    ),

                                  ],
                                  rows: List<DataRow>.generate(
                                      checkMovementState.myList.length,
                                          (index) =>
                                          DataRow(
                                              onSelectChanged: (a) {
                                                print("tıklandı");
                                              },
                                              cells: [
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .checkMovement}"),),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .checkStatus}"),),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .currencyType}"),),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .checkBank}")),
                                                DataCell(Text(
                                                    PriceFormat.instance.formatter.format(double.parse(checkMovementState.myList[index].amount!)))),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .checkType}")),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .expiryDate}")),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .drawPlace}")),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .checkHolder}")),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .checkHolderTc}")),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .checkSystemNo}")),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .systemNo}")),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .checkNo}")),
                                                DataCell(Text(
                                                    "${checkMovementState.myList[index]
                                                        .explanation}")),
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
                    else if(checkMovementState is CheckMovementError)
                    {

                      ToastMessage.instance.errorMessage(errorMessage:checkMovementState.errorMessage);
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

