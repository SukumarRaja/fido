import 'dart:convert';

import 'package:fido/app/data/model/update_profile.dart';

import '../../services/api.dart';
import '../../services/http.dart';
import '../model/profile.dart';

class ProfileRepository {
  final HttpHelper helper = HttpHelper();

  Future<ProfileRes> getProfile({required userId}) async {
    var response = await helper.get(url: "${ApiService.getProfile}$userId");
    var res = ProfileRes.fromMap(jsonDecode(response));
    return res;
  }

  Future<UpdateProfileRes> updateProfile({required body}) async {
    var response = await helper.post(url: ApiService.updateProfile, body: body);
    var res = UpdateProfileRes.fromMap(jsonDecode(response));
    return res;
  }

  Future<dynamic> getAddress() async {
    var response = await helper.get(url: ApiService.getAddress);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> addAddress({required body}) async {
    var response = await helper.post(url: ApiService.addAddress, body: body);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> removeAddress({required body}) async {
    var response = await helper.post(url: ApiService.removeAddress, body: body);
    var res = jsonDecode(response);
    return res;
  }

  Future<dynamic> getAllOrders() async {
    var response = await helper.get(url: ApiService.getAllOrders);
    var res = jsonDecode(response);
    return res;
  }
}
