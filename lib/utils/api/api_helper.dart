import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user/screen/home/modal/home_modal.dart';

class ApiHelper
{

  Future<UserModal> UserApi()
  async {
    String link ="https://randomuser.me/api/";
    Uri uri = Uri.parse(link);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);

    UserModal u1 = UserModal.fromJson(json);
    return u1;
  }
}