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

import 'promissory_movement_cubit.dart';
import 'promissory_movement_state.dart';
class PromissoryMovementView extends StatefulWidget {
  const PromissoryMovementView({Key? key}) : super(key: key);

  @override
  _PromissoryMovementViewState createState() => _PromissoryMovementViewState();
}

class _PromissoryMovementViewState extends State<PromissoryMovementView> {

  @override
  Widget build(BuildContext context) {
    BaseReportViewModel baseReportViewModel = context.watch<BaseReportViewModel>();
    return BaseView<PromissoryMovementCubit>
      (
        viewModel: PromissoryMovementCubit(),
      init: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
        context.read<PromissoryMovementCubit>().getPromissoryMovementList();
      },
      dispose: (viewModel){
          context.portraitUpView;
          baseReportViewModel.clear();

      },
        onPageBuilder:(BuildContext context, PromissoryMovementCubit viewModel) => Scaffold(
          appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: ColorConstants.instance.appBackgroundColor,
          ),
          leading: IconButton(icon:const Icon(Icons.arrow_back),color: ColorConstants.instance.customBlueColor, onPressed: () {NavigationService.instance.returnBack(context);},),
          title: baseReportViewModel.isSearching == false ?
          const Text("Senet Hareketi",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              :
          TextFieldStandard(
            hintText: "Herhangi Bir Şey Arayın",
            onChanged: (searchResult){
              baseReportViewModel.searchedData = searchResult;
              context.read<PromissoryMovementCubit>().searchData(baseReportViewModel.searchedData);

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

                    context.read<PromissoryMovementCubit>().searchData(baseReportViewModel.selectedData);

                }
            ),
          ],
        ),
          body:WillPopScope(
            onWillPop: () => NavigationService.instance.returnBack(context),
            child: SizedBox(
              height: context.screenHeight,
              width: context.screenWidth,
              child:BlocBuilder<PromissoryMovementCubit,IPromissoryMovementState>
                (
                  builder: (context,promissoryMovementState){
                    if(promissoryMovementState is PromissoryMovementLoading)
                    {

                      return const CustomCircularProgressIndicator();

                    }
                    else if(promissoryMovementState is PromissoryMovementLoaded)
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
                                  dataList: promissoryMovementState.myList,
                                  columns:const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        "Durum",
                                        maxLines: 3,
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text("Senet Hareket",
                                          maxLines: 3,
                                        )
                                    ),
                                    DataColumn(
                                        label: Text("Ünvan",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Borçlu",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Miktar",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Alacaklı",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Vade T",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Döviz Türü",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Senet Sistem No",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Sistem No",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("TC NO",
                                          maxLines: 3,)
                                    ),
                                    DataColumn(
                                        label: Text("Açıklama",
                                          maxLines: 3,)
                                    ),

                                  ],
                                  rows: List<DataRow>.generate(
                                      promissoryMovementState.myList.length,
                                          (index) =>
                                          DataRow(
                                              onSelectChanged: (a) {
                                                print("tıklandı");
                                              },
                                              cells: [
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
                                                        .promissoryStatus}"),),
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
                                                        .promissoryMovement}"),),
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
                                                        .title}"),),
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
                                                        .deptor}")),
                                                DataCell(Text(
                                                    PriceFormat.instance.formatter.format(double.parse(promissoryMovementState.myList[index].amount!)))),
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
                                                        .payee}")),
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
                                                        .expiryDate}")),
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
                                                        .currencyType}")),
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
                                                        .promissorySystemNo}")),
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
                                                        .systemNo}")),
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
                                                        .tc}")),
                                                DataCell(Text(
                                                    "${promissoryMovementState.myList[index]
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
                    else if(promissoryMovementState is PromissoryMovementError)
                    {

                      ToastMessage.instance.errorMessage(errorMessage:promissoryMovementState.errorMessage);
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

