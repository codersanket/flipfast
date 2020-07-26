import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:main/pages/detailsPage.dart';
import 'package:main/providers/product_provider.dart';
import 'package:main/widgets/cards.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce/woocommerce.dart';

class listOfProduct2 extends StatefulWidget {
	final List<WooProduct> wooProduct;
	final String name;
	listOfProduct2(this.wooProduct,this.name);


  @override
  _listOfProduct2State createState() => _listOfProduct2State();
}

class _listOfProduct2State extends State<listOfProduct2> {

	ScrollController _scrollController=ScrollController();
 var _page=1;
	WooCommerce _wooCommerce = WooCommerce(
			baseUrl: "https://flipfast.in",
			consumerKey: "ck_67bd47615ec90fa56ad20e340f4dba40b1583ca9",
			consumerSecret: 'cs_5a38c2fa88a7ad553633256285a7299f4531f156');
bool isLoading =false;
	@override
	void dispose() {
		_scrollController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {

		final prod = Provider.of<getProducts>(context);
		return Scaffold(
				backgroundColor: Colors.white.withOpacity(0.8),
				appBar: AppBar(
					title: Text(widget.name),
				),
				body:widget.wooProduct== null
						? Center(child: CircularProgressIndicator(),)
						: GridView.builder(
					controller: _scrollController,
					cacheExtent: 500,
					semanticChildCount: 80,
					gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder:(context,index){
					return GestureDetector(

						onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailsPage(wooProduct: widget.wooProduct[index],))),
					  child: card(
					  	imageurl:widget.wooProduct[index].images.isEmpty?"https://flipfast.in/wp-content/uploads/woocommerce-placeholder.png":widget.wooProduct[index].images[0].src,
					  	title: widget.wooProduct[index].name,
					  	price: widget.wooProduct[index].regularPrice,
					  	discountPrice: widget.wooProduct[index].price,
					  ),
					);


				},
					itemCount: widget.wooProduct.length,
				)

		);
	}

	@override
	void initState() {
		_scrollController.addListener(() {
			if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){

				getMoreProduct();
			}
		});
	}

	getMoreProduct()async{
		_page+=_page;
		print('Hello');
		List<WooProduct> _wooProduct= await _wooCommerce.getProducts(perPage: 10,page: _page,search: widget.name);
	setState(() {
		_wooProduct.forEach((element) {widget.wooProduct.add(element);});
	});
		print(_wooProduct);

	}

}