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

import 'case_movement_cubit.dart';
import 'case_movement_state.dart';
class CaseMovementView extends StatefulWidget {
  const CaseMovementView({Key? key}) : super(key: key);

  @override
  _CaseMovementViewState createState() => _CaseMovementViewState();
}

class _CaseMovementViewState extends State<CaseMovementView> {

  @override
  Widget build(BuildContext context) {
    BaseReportViewModel baseReportViewModel = context.watch<BaseReportViewModel>();
    return BaseView<CaseMovementCubit>
      (
        viewModel: CaseMovementCubit(),
      init: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
        context.read<CaseMovementCubit>().getCaseMovementList();
      },
      dispose: (viewModel){
          context.portraitUpView;
          baseReportViewModel.clear();

      },
        onPageBuilder:(BuildContext context, CaseMovementCubit viewModel) => Scaffold(
          appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: ColorConstants.instance.appBackgroundColor,
          ),
          leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
          title: baseReportViewModel.isSearching == false ?
          const Text("Kasa Hareketi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              :
          TextFieldStandard(
            hintText: "Döviz Türü,Hesap No,Ek No,Kasa Türü Arayın",
            onChanged: (searchResult){
              baseReportViewModel.searchedData = searchResult;
              context.read<CaseMovementCubit>().searchData(baseReportViewModel.searchedData);

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

                    context.read<CaseMovementCubit>().searchData(baseReportViewModel.selectedData);

                }
            ),
          ],
        ),
          body:WillPopScope(
            onWillPop: () => NavigationService.instance.returnBack(context),
            child: SizedBox(
              height: context.screenHeight,
              width: context.screenWidth,
              child:BlocBuilder<CaseMovementCubit,ICaseMovementState>
                (
                  builder: (context,caseMovementState){
                    if(caseMovementState is CaseMovementLoading)
                    {

                      return const CustomCircularProgressIndicator();

                    }
                    else if(caseMovementState is CaseMovementLoaded)
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
                                  dataList: caseMovementState.myList,
                                  columns:const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        "Türü",
                                        maxLines: 3,
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text("Toplam",
                                          maxLines: 3,
                                        )
                                    ),
                                    DataColumn(
                                        label: Text("Döviz Türü",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Hesap No",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("EkNo",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Banka",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Kasa Türü",
                                          maxLines: 3,)
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                      caseMovementState.myList.length,
                                          (index) =>
                                          DataRow(
                                              onSelectChanged: (a) {
                                                print("tıklandı");
                                              },
                                              cells: [
                                                DataCell(Text(
                                                    "${caseMovementState.myList[index]
                                                        .type}"),),
                                                DataCell(Text(
                                                    PriceFormat.instance.formatter.format(double.parse(caseMovementState.myList[index].amount!)))),
                                                DataCell(Text(
                                                    "${caseMovementState.myList[index]
                                                        .currencyType}"),),
                                                DataCell(Text(
                                                    "${caseMovementState.myList[index]
                                                        .accountNumber}"),),

                                                DataCell(Text(
                                                    "${caseMovementState.myList[index]
                                                        .annexNumber}")),
                                                DataCell(Text(
                                                    "${caseMovementState.myList[index]
                                                        .bank}")),
                                                DataCell(Text(
                                                    "${caseMovementState.myList[index]
                                                        .caseType}")),
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
                    else if(caseMovementState is CaseMovementError)
                    {

                      ToastMessage.instance.errorMessage(errorMessage:caseMovementState.errorMessage);
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

