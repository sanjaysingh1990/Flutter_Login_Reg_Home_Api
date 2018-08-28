class ScheduleList {
  String _id;
  String _scheduleDate;
  num _daysLeft;

  String get id => _id;
  String get scheduleDate => _scheduleDate;
  num get daysLeft => _daysLeft;

  ScheduleList.map(dynamic obj) {
    this._id = obj["id"];
    this._scheduleDate = obj["schedule_date"];
    this._daysLeft = obj["days_left"];
  }


}