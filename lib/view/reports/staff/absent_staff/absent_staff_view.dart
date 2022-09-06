import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_seat_application/core/base/view/base_view.dart';
import 'package:motaperp_seat_application/core/constant/design/color_constant.dart';
import 'package:motaperp_seat_application/core/constant/text_format/price_format.dart';
import 'package:motaperp_seat_application/core/extension/context_extension.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';
import 'package:motaperp_seat_application/core/widget/appBar/rounded_rectangle_app_bar.dart';
import 'package:motaperp_seat_application/core/widget/loading/circular_progress_indicator.dart';
import 'package:motaperp_seat_application/core/widget/message/toast_message.dart';
import 'package:motaperp_seat_application/core/widget/scrollBar/custom_scrollbar.dart';
import 'package:motaperp_seat_application/core/widget/table/custom_data_table.dart';
import 'package:motaperp_seat_application/core/widget/text_field/text_field_standard.dart';
import 'package:motaperp_seat_application/view/reports/base/base_report_view_model.dart';
import 'package:provider/provider.dart';
import 'absent_staff_cubit.dart';
import 'absent_staff_state.dart';
class AbsentStaffView extends StatefulWidget {
  const AbsentStaffView({Key? key}) : super(key: key);

  @override
  _AbsentStaffViewState createState() => _AbsentStaffViewState();
}

class _AbsentStaffViewState extends State<AbsentStaffView> {

  @override
  Widget build(BuildContext context) {
    BaseReportViewModel baseReportViewModel = context.watch<BaseReportViewModel>();
    return BaseView<AbsentStaffCubit>
      (
        viewModel: AbsentStaffCubit(),
      init: (viewModel) {
        viewModel.setContext(context);
        viewModel.init();
        context.read<AbsentStaffCubit>().getAbsentStaffList();
      },
      dispose: (viewModel){
          context.portraitUpView;
          baseReportViewModel.clear();

      },
        onPageBuilder:(BuildContext context, AbsentStaffCubit viewModel) => Scaffold(
          appBar: RoundedRectangleAppBar(
          title: baseReportViewModel.isSearching == false ?
          const Text("Günlük Gelmeyen Personeller",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
              :
          TextFieldStandard(
            hintText: "Herhangi Bir Şey Arayın",
            onChanged: (searchResult){
              baseReportViewModel.searchedData = searchResult;
              context.read<AbsentStaffCubit>().searchData(baseReportViewModel.searchedData);

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

                    context.read<AbsentStaffCubit>().searchData(baseReportViewModel.selectedData);

                }
            ),
          ],
        ),
          body:WillPopScope(
            onWillPop: () => NavigationService.instance.returnBack(context),
            child: SizedBox(
              height: context.screenHeight,
              width: context.screenWidth,
              child:BlocBuilder<AbsentStaffCubit,IAbsentStaffState>
                (
                  builder: (context,absentStaffState){
                    if(absentStaffState is AbsentStaffLoading)
                    {

                      return const CustomCircularProgressIndicator();

                    }
                    else if(absentStaffState is AbsentStaffLoaded)
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
                                  dataList: absentStaffState.myList,
                                  columns:const <DataColumn>[
                                    DataColumn(
                                      label: Text(
                                        "Ad Soyad",
                                        maxLines: 3,
                                      ),
                                    ),
                                    DataColumn(
                                        label: Text("Gelme Durumu",
                                          maxLines: 3,
                                        )
                                    ),

                                  ],
                                  rows: List<DataRow>.generate(
                                      absentStaffState.myList.length,
                                          (index) =>
                                          DataRow(
                                              onSelectChanged: (a) {
                                                print("tıklandı");
                                              },
                                              cells: [
                                                DataCell(Text(
                                                    "${absentStaffState.myList[index]
                                                        .employeeName}"),),
                                                DataCell(Text(
                                                    "${absentStaffState.myList[index]
                                                        .status}"),),

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
                    else if(absentStaffState is AbsentStaffError)
                    {

                      ToastMessage.instance.errorMessage(errorMessage:absentStaffState.errorMessage);
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

