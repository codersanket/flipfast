import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/models/wishlist.dart';
import 'package:main/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class wishlistScreen extends StatefulWidget {

  @override
  _wishlistScreenState createState() => _wishlistScreenState();
}

class _wishlistScreenState extends State<wishlistScreen> {

Box<wishlist> yourWishes;
String wishes='Wishes';
@override
	Widget build(BuildContext context) {
		

		return ValueListenableBuilder(valueListenable: yourWishes.listenable(), builder: (context,Box<wishlist>box ,_){
			return ListView.builder(itemBuilder: (context,index){
				wishlist wish=yourWishes.get(index);
				return ListTile(
				title: Text(wish.productName),
					leading: Image.network(wish.imageUrl),
					trailing: Text(wish.productPrice),
				);
			});

		});
	}

@override
void initState() async{
	await Hive.initFlutter();
	await Hive.openBox(wishes);
	yourWishes=Hive.box(wishes);
}
}
