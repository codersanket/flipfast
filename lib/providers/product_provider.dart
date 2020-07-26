import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:main/models/products.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:woocommerce/woocommerce.dart';

class getProducts extends ChangeNotifier {
  String username = 'ck_67bd47615ec90fa56ad20e340f4dba40b1583ca9';
  String password = 'cs_5a38c2fa88a7ad553633256285a7299f4531f156';
  var _page = 1;
  List<Product> _list = List();
  List<WooProduct> _onSale = [];

  List<WooProduct> get onSale => _onSale;
  WooCommerce _wooCommerce = WooCommerce(
      baseUrl: "https://flipfast.in",
      consumerKey: "ck_67bd47615ec90fa56ad20e340f4dba40b1583ca9",
      consumerSecret: 'cs_5a38c2fa88a7ad553633256285a7299f4531f156');

  List<Product> get list => _list;

  Future<List<Product>> fetchProducts(int id) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    var response = await http.get(
        "https://flipfast.in/wp-json/wc/v3/products/$id",
        headers: <String, String>{'authorization': basicAuth});

    _list = (jsonDecode(response.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    notifyListeners();
    return _list;
  }

  onSaleFunction() async {
    try {
      _onSale = await _wooCommerce.getProducts(onSale: true);
      notifyListeners();
    }
    catch (e) {
      print(e);
    }
  }

  List<WooProduct> product_2;


  Future<List<WooProduct>> getProductByCategery(String id) async {
   try{
     product_2 = await _wooCommerce.getProducts(category: id, perPage: 100);
     notifyListeners();
   }catch(e){
     print(e);
   }

  }


  List<WooProduct> _dailyneedProduct;

  List <WooProduct> get dailyneedProduct => _dailyneedProduct;

  Future<List<WooProduct>> getDailyNeddProduct() async {
    try {
      _dailyneedProduct =
      await _wooCommerce.getProducts(category: '159', perPage: 100,stockStatus: 'instock');
      var compare = (WooProduct a, WooProduct b) => a.price.compareTo(b.price);
      _dailyneedProduct.sort(compare);
      notifyListeners();
      return _dailyneedProduct;
    }
    catch (e) {
      print(e);
    }
  }


  List<WooProduct> allProduct;




   }
