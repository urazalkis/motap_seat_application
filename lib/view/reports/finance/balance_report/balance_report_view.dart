import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/view/base_view.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/text_format/price_format.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/drop_down_button/dropdown_search_button.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/core/widget/scrollBar/custom_scrollbar.dart';
import 'package:motaperp_seat_application/core/widget/table/custom_data_table.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_field_standard.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:motaperp_seat_application/view/reports/base/current/current_cubit.dart';
import 'package:motaperp_seat_application/view/reports/base/current/current_state.dart';
import 'package:motaperp_seat_application/view/reports/finance/balance_report/balance_report_cubit.dart';
import 'package:provider/provider.dart';

import 'balance_report_state.dart';
class BalanceReportView extends StatefulWidget {
  const BalanceReportView({Key? key}) : super(key: key);

  @override
  _BalanceReportViewState createState() => _BalanceReportViewState();
}

class _BalanceReportViewState extends State<BalanceReportView> {

  @override
  Widget build(BuildContext context) {
    BaseReportViewModel baseReportViewModel = context.watch<BaseReportViewModel>();
    return BaseView<BalanceReportCubit>
      (
        viewModel: BalanceReportCubit(),
      init: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
        context.read<CurrentCubit>().getCurrent();
        context.read<BalanceReportCubit>().getBalanceList("");
      },
      dispose: (viewModel){
          context.portraitUpView;
          baseReportViewModel.clear();

      },
        onPageBuilder:(BuildContext context, BalanceReportCubit viewModel) => Scaffold(
          appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: ColorConstants.instance.appBackgroundColor,
          ),
          leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
          title: baseReportViewModel.isSearching == false ?
          const Text("Bakiye Raporu",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              :
          TextFieldStandard(
            hintText: "Döviz Türü,Cari Türü arayın",
            onChanged: (searchResult){
              baseReportViewModel.searchedData = searchResult;
              context.read<BalanceReportCubit>().searchData(baseReportViewModel.selectedData,baseReportViewModel.searchedData);

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

                    context.read<BalanceReportCubit>().getBalanceList(baseReportViewModel.selectedData);

                }

              },
            ),
          ],
        ),
          body:WillPopScope(
            onWillPop: () => NavigationService.instance.returnBack(context),
            child: SizedBox(
              height: context.screenHeight,
              width: context.screenWidth,
              child: BlocBuilder<CurrentCubit,ICurrentState>(
                  builder: (context,currentState){
                    if(currentState is CurrentLoading)
                    {
                      return const CustomCircularProgressIndicator();
                    }
                    else if(currentState is CurrentLoaded){

                      baseReportViewModel.itemIdList = [];
                      baseReportViewModel.itemNameList = [];
                      baseReportViewModel.fillCurrentList(currentState.showList,context.read<BaseReportViewModel>().itemNameList,context.read<BaseReportViewModel>().itemIdList);
                       return Column(
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
                               context.read<BalanceReportCubit>().getBalanceList(baseReportViewModel.selectedData);
                               print(selectedData);
                             },
                             onChangedDataId: (String? selectedDataId){
                               baseReportViewModel.selectedItemId = selectedDataId;
                             },
                           ),
                           BlocBuilder<BalanceReportCubit,IBalanceReportState>
                             (
                               builder: (context,balanceReportState){
                                 if(balanceReportState is CaseMovementLoading)
                                 {

                                   return const CustomCircularProgressIndicator();

                                 }
                                 else if(balanceReportState is BalanceReportLoaded)
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
                                                 dataList: balanceReportState.myList ?? [],
                                                 columns:const <DataColumn>[
                                                   DataColumn(
                                                     label: Text(
                                                       "Cari Türü",
                                                       maxLines: 3,
                                                     ),
                                                   ),
                                                   DataColumn(
                                                       label: Text("Cari Ünvanı",
                                                         maxLines: 3,
                                                       )
                                                   ),
                                                   DataColumn(
                                                       label: Text("Bakiye",
                                                         maxLines: 3,)
                                                   ),
                                                   DataColumn(
                                                       label: Text("Döviz",
                                                         maxLines: 3,)
                                                   ),
                                                   DataColumn(
                                                       label: Text("Durumu",
                                                         maxLines: 3,)
                                                   ),
                                                 ],
                                                 rows: List<DataRow>.generate(
                                                     balanceReportState.myList!.length,
                                                         (index) =>
                                                         DataRow(
                                                             onSelectChanged: (a) {
                                                               print("tıklandı");
                                                             },
                                                             cells: [
                                                               DataCell(Text(
                                                                   "${balanceReportState.myList![index]!
                                                                       .currentType}"),),
                                                               DataCell(Text(
                                                                   "${balanceReportState.myList![index]!
                                                                       .currentTitle}"),),
                                                               DataCell(Text(
                                                                   PriceFormat.instance.formatter.format(double.parse(balanceReportState.myList![index]!.totalDeptReceive!)))),
                                                               DataCell(Text(
                                                                   "${balanceReportState.myList![index]!
                                                                       .currencyType}")),
                                                               DataCell(Text(
                                                                   "${balanceReportState.myList![index]!
                                                                       .status}")),
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
                                 else if(balanceReportState is BalanceReportError)
                                 {

                                   ToastMessage.instance.errorMessage(errorMessage:balanceReportState.errorMessage);
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
    ),
    );
  }
}

