

import 'package:flutter/material.dart';
import 'package:woocommerce/woocommerce.dart';

class cartProvider extends ChangeNotifier{
	WooCommerce _wooCommerce = WooCommerce(
			baseUrl: "https://flipfast.in",
			consumerKey: "ck_67bd47615ec90fa56ad20e340f4dba40b1583ca9",
			consumerSecret: 'cs_5a38c2fa88a7ad553633256285a7299f4531f156');

	List<WooCartItem> _cartItem=[];
	List<WooCartItem> get cartItem=>_cartItem;


	


}