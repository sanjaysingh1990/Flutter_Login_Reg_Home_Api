

import 'package:flutter_app_plugin_test/data/rest_ds.dart';
import 'package:flutter_app_plugin_test/models/LoginResponse.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(LoginResponse response);
  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestDatasource api = new RestDatasource();
  LoginScreenPresenter(this._view);

  doLogin(String email, String password) async{
   try
   {
     LoginResponse response= await api.login(email, password);
    _view.onLoginSuccess(response);
   }
   catch (e)
    {
      _view.onLoginError(e.toString());

   }
  }
}