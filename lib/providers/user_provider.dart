import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:main/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woocommerce/woocommerce.dart';
import 'package:http/http.dart';

class user extends ChangeNotifier {
  WooCommerce _wooCommerce = WooCommerce(
      baseUrl: "https://flipfast.in",
      consumerKey: "ck_67bd47615ec90fa56ad20e340f4dba40b1583ca9",
      consumerSecret: 'cs_5a38c2fa88a7ad553633256285a7299f4531f156');
  var currentUser;
  var users2;
  String _storeToken;
  String get storeToken => _storeToken;

  Future<String> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _storeToken = prefs.getString('token');
    notifyListeners();
    return _storeToken;
  }

  Future<dynamic> loginUser(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('$username $password');
    try{var response = await post("https://flipfast.in/wp-json/jwt-auth/v1/token",
        body: {'username': username, 'password': password});
    users2 = JwtAuth.fromJson(jsonDecode(response.body));
    print(response.body);}
    catch(e){
      print(e);
    }

    var token = users2.data.token;
    prefs.setString('token', token);
    print(token);
    notifyListeners();
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future   registerUser2(String firstname,String lastname,String username,String email,String password,)async{
    print(firstname);
  try{
    WooCustomer userw = WooCustomer(username: username, password: password, email: email,firstName: firstname,lastName: lastname);
    var result=await _wooCommerce.createCustomer(userw);

    print(result);
    SharedPreferences prefs=await SharedPreferences.getInstance();
    var response = await post("https://flipfast.in/wp-json/jwt-auth/v1/token",
        body: {'username': username, 'password': password});
    users2 = JwtAuth.fromJson(jsonDecode(response.body));
    print(response.body);

    var token = users2.data.token;
    prefs.setString('token', token);
    print(token);
    notifyListeners();
    print(result);
    return userw.id;
  }
  catch(e){
    print(e);
  }
  }
}
