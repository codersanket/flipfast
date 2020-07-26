import 'package:flutter/material.dart';
import 'package:main/providers/product_provider.dart';
import 'package:main/widgets/cards.dart';
import 'package:provider/provider.dart';

class listOfProduct extends StatelessWidget {
	final int id;
	final String name;

	listOfProduct(this.id, this.name);

	@override
	Widget build(BuildContext context) {
		print(id.toString());
		final prod = Provider.of<getProducts>(context).product_2;
		return Scaffold(
			backgroundColor: Colors.white.withOpacity(0.8),
			appBar: AppBar(
				title: Text(name),
			),
		body:prod== null
				? Center(child: CircularProgressIndicator(),)
				: prod.isEmpty?Center(child: Text("No Product Found"),):GridView.builder(
			cacheExtent: 80,
			gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder:(context,index){
			return Container(
				child:card(
					imageurl: prod[index].images.isEmpty?"https://flipfast.in/wp-content/uploads/woocommerce-placeholder.png":prod[index].images[0].src,
					title: prod[index].name,
					price: prod[index].regularPrice,
					discountPrice: prod[index].price,
				)
				);


		},
		itemCount: prod.length,
		)

		);
		}



}