import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:main/pages/detailsPage.dart';
import 'package:main/providers/product_provider.dart';
import 'package:main/values.dart';
import 'package:main/widgets/cards.dart';
import 'package:provider/provider.dart';
import 'package:woocommerce/woocommerce.dart';

class search extends SearchDelegate{


	WooCommerce _wooCommerce = WooCommerce(
			baseUrl: "https://flipfast.in",
			consumerKey: "ck_67bd47615ec90fa56ad20e340f4dba40b1583ca9",
			consumerSecret: 'cs_5a38c2fa88a7ad553633256285a7299f4531f156');
	List<WooProduct> wooProduct=[];
	List<WooProduct> temp;
	var _page=1;

	getAllProducts()async{
	 	do{
	 		try{
			  temp=await _wooCommerce.getProducts(perPage: 100,page:_page);
			  if(temp.isNotEmpty)
			 {
				 temp.forEach((element) {wooProduct.add(element);});
				 _page++;
				 print(_page);
				 print(temp);
				 temp.clear();
				 print(wooProduct.length);
				 print(_page);
			 }else break;
	 		}catch(e){
	 			print("Error $e");
		  }
	 		return wooProduct;
	  } while(temp.isEmpty);

	}


  @override
  List<Widget> buildActions(BuildContext context) {

	 	return [
	   IconButton(
			   icon: Icon(Icons.clear),
	   onPressed: () {
		   query = '';
	   },)
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {

	  return IconButton(
		  icon: Icon(Icons.arrow_back),
		  onPressed: () {
			  close(context, null);
		  },
	  );
  }

  @override
  Widget buildResults(BuildContext context) {

	 	List<WooProduct> result=wooProduct.where((element) => element.name.contains(query)).toList();
	 	result=result.toSet().toList();

	  return result.isEmpty?Center(child: CircularProgressIndicator()):GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
		  return GestureDetector(
			  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailsPage(wooProduct:result[index],))),

		    child: card(

			  imageurl:result[index].images[0].src ,
			  title: result[index].name,
			  price: result[index].regularPrice,
			  discountPrice:result[index].price,

		    ),
		  );
	  },
		  itemCount: result.length,
	  );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
	  getAllProducts();
	  List<WooProduct> Suggestions=wooProduct.where((element) => element.name.contains(query)).toList();
	  Suggestions=Suggestions.toSet().toList();
	 return  ListView.builder(itemBuilder: (context,index){

				  return Card(

					  elevation: 2,
					  child: ListTile(
							  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailsPage(wooProduct:Suggestions[index],))),
							  leading: Container(
									  width: MediaQuery.of(context).size.width*0.3,
									  child: Image.network(Suggestions[index].images[0].src)),
							  title: Text(Suggestions[index].name),
							  subtitle: Text(parse(Suggestions[index].shortDescription).documentElement.text,maxLines: 2,),
							  trailing: Text("₹${Suggestions[index].price}",style: TextStyle(
								  color: secondaryColor,
								  fontSize: 18
							  ),),

					  ),
				  );
			  },itemCount: Suggestions.length,);
	  }












  }

