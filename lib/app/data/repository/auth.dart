import 'dart:convert';

import 'package:fido/app/services/api.dart';
import 'package:fido/app/services/http.dart';

class AuthRepository{
  final HttpHelper helper=HttpHelper();
  Future<dynamic> login({required body})async{
    var response=await helper.post(url: ApiService.login, body: body);
    var res=jsonDecode(response);
    return res;
  }
}