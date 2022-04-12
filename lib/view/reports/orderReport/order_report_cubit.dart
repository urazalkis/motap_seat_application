import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_report_model_response.dart';
import 'order_report_service.dart';
import 'order_report_state.dart';

class OrderReportCubit extends Cubit<IOrderReportState>
{
  IOrderReportService orderReportService;
  OrderReportCubit(this.orderReportService):super(OrderReportInit());

  Future<void> getOrderList(String? current) async {

    try{
      bool isLoading = true;
      emit(OrderReportLoading(isLoading));
      List<OrderReportList> showOrderList = await orderReportService.orderList(current);
      emit(OrderReportLoaded(showOrderList));
      isLoading = false;
      print("başarılı");
    }
    catch(e){
      emit(OrderReportError("Detay Bilgileri Alınamadı $e"));

    }
  }

  Future<void> getOrderListWithFilter(String? current,String? minDate,String? maxDate) async {

    try{
      bool isLoading = true;
      emit(OrderReportLoading(isLoading));
      List<OrderReportList> showOrderList = await orderReportService.orderListWithFilter(current,minDate,maxDate);
      emit(OrderReportLoaded(showOrderList));
      isLoading = false;
      print("başarılı");

    }
    catch(e){
      emit(OrderReportError("Detay Bilgileri Alınamadı $e"));

    }
  }
  Future<void> searchData(String? current,String? data) async {

    try{
      bool isLoading = true;
      emit(OrderReportLoading(isLoading));
      List<OrderReportList> showSearchedList = await orderReportService.searchData(current, data);
      emit(OrderReportLoaded(showSearchedList));
      print("başarılı");
      isLoading = false;
    }
    catch(e){
      emit(OrderReportError("Detay Bilgileri Alınamadı $e"));

    }
  }
  Future<void> searchDataWithFilter(String? current,String? data,String? minDate,String? maxDate) async {

    try{
      bool isLoading = true;
      emit(OrderReportLoading(isLoading));
      List<OrderReportList> showSearchedList = await orderReportService.searchDataWithFilter(current,data,minDate,maxDate);
      emit(OrderReportLoaded(showSearchedList));
      print("başarılı");
      isLoading = false;
    }
    catch(e){
      emit(OrderReportError("Detay Bilgileri Alınamadı $e"));

    }
  }
}