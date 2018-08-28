import 'package:flutter_app_plugin_test/models/home/ScheduleList.dart';

class DataItem {
  String _id;
  String _title;
  String _description;
  bool _isReccuring;
  ScheduleList _scheduleList;

  String get id => _id;
  String get title => _title;
  String get description => _description;
  bool get isRecurring => _isReccuring;
  ScheduleList get scheduleList => _scheduleList;

  DataItem.map(dynamic obj) {
    this._id = obj["id"];
    this._title = obj["title"];
    this._description = obj["description"];
    this._isReccuring = obj["is_recurring"];
    this._scheduleList =new ScheduleList.map(obj["schedule_list"]);

  }


}