import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_user/screen/home/modal/home_modal.dart';
import 'package:random_user/utils/api/api_helper.dart';

class HomeProvider extends ChangeNotifier
{

  int index=0;

  Future<UserModal> apiCall()
  async {
    return await ApiHelper().UserApi();
  }

  void changeindex()
  {
    Random random=Random();
    index=random.nextInt(5);
    notifyListeners();
  }
}