import 'package:flutter/material.dart';
import 'package:main/models/categery_model.dart';
import 'package:main/pages/listOfProduct.dart';
import 'package:main/providers/product_provider.dart';
import 'package:main/values.dart';
import 'package:provider/provider.dart';

class drawer extends StatelessWidget {
  
  List<categories_model> productCategery=[
    categories_model(274, "https://flipfast.in/wp-content/uploads/2020/03/menu1-1.png","Gifts,Sports"),
    categories_model(277, "https://flipfast.in/wp-content/uploads/2020/03/breakfast-1.png","BreakFast"),
    categories_model(275, "https://flipfast.in/wp-content/uploads/2020/03/coffee-cup-1.png","Cofee"),
    categories_model(158, "https://flipfast.in/wp-content/uploads/2020/03/veg.png","Fruits & Vegis"),
    categories_model(180, "https://flipfast.in/wp-content/uploads/2020/03/dal-makhani-1.png","Dals&Pulses"),
    categories_model(156, "https://flipfast.in/wp-content/uploads/2020/03/bak.png","Bakery"),
    categories_model(157, "https://flipfast.in/wp-content/uploads/2020/03/eg.png","Egg,Meat & Fish"),
    categories_model(116, "https://flipfast.in/wp-content/uploads/2020/03/mos.png","Mosquito Repellent"),
    categories_model(149, "https://flipfast.in/wp-content/uploads/2020/03/han.png","Handwash and Sanitizer"),






  ];
  @override
  Widget build(BuildContext context) {
    final prod=Provider.of<getProducts>(context);
   return Column(
     children: [
       Container(
         width: double.infinity,
         height: MediaQuery.of(context).size.height*0.1,
         child: DrawerHeader(child:Text("Categories",style: TextStyle(
           color: Colors.black,
           fontSize:25
         ),),decoration: BoxDecoration(
         ),

         ),
       ),
       Expanded(
         child: ListView.builder(itemBuilder: (context,index){
         return Container(
           decoration: BoxDecoration(
             border: Border.all(
               color: Colors.grey.withOpacity(0.2)
             )
           ),
           child: ListTile(
              onTap: (){
                prod.product_2=null;
              prod.getProductByCategery(productCategery[index].id.toString());
              Navigator.push(context, MaterialPageRoute(builder: (context)=>listOfProduct(productCategery[index].id,productCategery[index].title)));
              },
             leading: Image.network(productCategery[index].url),
             title: Text(productCategery[index].title),
             trailing: Icon(Icons.arrow_forward_ios),
           ),
         );
         },
         itemCount: productCategery.length,
         ),
       ),
     ],
   );
  }
}
