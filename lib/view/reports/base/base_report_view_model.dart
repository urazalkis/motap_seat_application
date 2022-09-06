import 'package:flutter/cupertino.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/view/reports/base/staff/staff_response.dart';

import 'current/current_model_response.dart';

class BaseReportViewModel extends ChangeNotifier{
  bool isSearching = false;
  String? searchedData;
  DateTime? selectedDateMin;
  DateTime? selectedDateMax;
  LocaleManager localeManager = LocaleManager.instance;

  String? selectedData;
  String? selectedItemId;
  List<String>? itemIdList = [];
  List<String>? itemNameList = [];

  late String dbName;
  late String dbUserName;
  late String dbPassword;

  String? getDropdownValueId(String? selectedData){
    if(selectedData!=null){
      int currentIndex =itemNameList!.indexOf(selectedData);
      selectedItemId = itemIdList![currentIndex];
      print("selected data:$selectedData");
      print("selected item id:$selectedItemId");
      return selectedItemId;
    }
    else{
      return null;
    }

  }
  void fillCurrentList(List<Current> list,List<String>? itemNameList,List<String>? itemIdList){

    for (var element in list) {
      itemNameList?.add(element.currentName);
      itemIdList?.add(element.currentID);
    }

  }
  void fillStaffList(List<StaffResponseModel> list,List<String>? itemNameList,List<String>? itemIdList){

    for (var element in list) {
      itemNameList?.add(element.name!);
      itemIdList?.add(element.id!);
    }

  }


  void  changeSearchStatus(){
    isSearching = !isSearching;
    notifyListeners();
  }

  void setDbInformation(){
    dbName =  localeManager.getStringValue(PreferencesKeys.dbName);
    dbUserName =   localeManager.getStringValue(PreferencesKeys.dbUserName);
    dbPassword =   localeManager.getStringValue(PreferencesKeys.dbPassword);
  }
  Map baseMapData(){
    Map data = {
      'db_name': localeManager.getStringValue(PreferencesKeys.dbName),
      'db_userName': localeManager.getStringValue(PreferencesKeys.dbUserName),
      'db_password': localeManager.getStringValue(PreferencesKeys.dbPassword),
    };

    return data;

  }
  void clear(){
    isSearching = false;
    searchedData=null;
    selectedDateMin=null;
    selectedDateMax=null;
    selectedData=null;
    selectedItemId=null;
    itemIdList= [];
    itemNameList= [];
  }

}