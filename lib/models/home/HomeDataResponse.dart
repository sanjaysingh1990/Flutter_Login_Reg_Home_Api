

import 'package:flutter_app_plugin_test/models/home/DataItem.dart';

class HomeDataResponse {
  bool _success;
  int _status;
  List<DataItem> _dataList;

  List<DataItem> get dataList=>_dataList;

  HomeDataResponse.map(dynamic obj) {
    this._success = obj["success"];
    this._status = obj["status"];


    var dataArray=obj["result"];
    _dataList=new List();
    for(var item in dataArray)
      {

        var dataITem=DataItem.map(item);
        _dataList.add(dataITem);

        print("data"+item.toString());
      }
    print("size"+_dataList.length.toString());
  }



}