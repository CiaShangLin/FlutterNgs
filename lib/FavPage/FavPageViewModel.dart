import 'package:flutter/material.dart';
import 'package:flutter_ngs/StateResponse.dart';

class FavPageViewModel extends ChangeNotifier{
  StateResponse stateResponse = StateResponse();

  void getApiData() {
    //資料不是null的話就不用再打了
    if (stateResponse.data != null) {
      return;
    }
    print('FavPageViewModel getApiData()');
    //模擬耗時api
    Future.delayed(Duration(seconds: 3)).then((value) {
      stateResponse.data = "Data";
      stateResponse.status = Status.SUCCESS;
      notifyListeners();
    }).onError((error, stackTrace) {
      stateResponse.data = "Error:$error";
      stateResponse.status = Status.ERROR;
      notifyListeners();
    });
  }
}