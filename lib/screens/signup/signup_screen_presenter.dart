

import 'package:flutter_app_plugin_test/data/rest_ds.dart';
import 'package:flutter_app_plugin_test/models/SignupResponse.dart';
import 'package:flutter_app_plugin_test/models/signuprequest.dart';
import 'package:flutter_app_plugin_test/models/LoginResponse.dart';

abstract class SignupScreenContract {
  void onSignupSuccess(SignupResponse res);
  void onSignupError(String errorTxt);
}

class SignupScreenPresenter {
  SignupScreenContract _view;
  RestDatasource api = new RestDatasource();
  SignupScreenPresenter(this._view);

  doSignup(SingnupRequest request) async{
   try
   {
     SignupResponse res= await api.signup(request);
    _view.onSignupSuccess(res);
   }
   catch (e)
    {
      _view.onSignupError(e.toString());

   }
  }
}