

import 'package:flutter_app_plugin_test/data/rest_ds.dart';
import 'package:flutter_app_plugin_test/models/SignupResponse.dart';
import 'package:flutter_app_plugin_test/models/home/HomeDataResponse.dart';
import 'package:flutter_app_plugin_test/models/signuprequest.dart';
import 'package:flutter_app_plugin_test/models/LoginResponse.dart';

abstract class HomeScreenContract {
  void onSuccess(HomeDataResponse res);
  void onError(String errorTxt);
}

class HomeScreenPresenter {
  HomeScreenContract _view;
  RestDatasource api = new RestDatasource();
  HomeScreenPresenter(this._view);

  loadData() async{
   try
   {
     HomeDataResponse res= await api.loadData();

    _view.onSuccess(res);
   }
   catch (e)
    {
      _view.onError(e.toString());

   }
  }
}