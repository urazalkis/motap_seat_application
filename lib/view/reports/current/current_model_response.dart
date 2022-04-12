class CurrentResponse {
  List<Current> currentList;

  CurrentResponse(this.currentList);

  factory CurrentResponse.fromJson(Map<String,dynamic> json){
    var jsonArray = json["currentList"] as List;
    List<Current> currentList = jsonArray.map((jsonArrayObject) =>
        Current.fromJson(jsonArrayObject)).toList();

    return CurrentResponse(currentList);
  }
}

class Current{
  String currentID;
  String currentName;

  Current(this.currentID,this.currentName);

  factory Current.fromJson(Map<String,dynamic> json){
    return Current(
      json["ID"] as dynamic,
      json["Unvan"] as dynamic,
    );

  }
}

