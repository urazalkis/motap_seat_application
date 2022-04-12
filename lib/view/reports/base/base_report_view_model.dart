import 'package:flutter/cupertino.dart';
import 'package:motaperp_seat_application/core/constant/enum/locale_keys_enum.dart';
import 'package:motaperp_seat_application/core/init/cache/locale_manager.dart';
import 'package:motaperp_seat_application/core/constant/navigation/navigation_constants.dart';
import 'package:motaperp_seat_application/core/init/navigation/navigation_service.dart';

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
  void fillDataList(List<dynamic> list,List<String>? itemNameList,List<String>? itemIdList){

    for (var element in list) {
      itemNameList?.add(element.currentName);
      itemIdList?.add(element.currentID);
    }

  }
  Future<bool> navigateToBack() async {
    clear();
    await NavigationService.instance.navigateToPageClear(path: NavigationConstants.ADMIN_MENU);
    return true;
  }


  void  changeSearchStatus(){
    isSearching = !isSearching;
    notifyListeners();
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