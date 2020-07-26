import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/pages/listOfProduct.dart';
import 'package:main/providers/product_provider.dart';
import 'package:provider/provider.dart';

class category extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String name;
  final int id;

  category({@required this.imageUrl,this.title,this.id,this.name});
  @override
  Widget build(BuildContext context) {
    final prod=Provider.of<getProducts>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),

      child: GestureDetector(
        onTap:(){
          prod.product_2=null;
          prod.getProductByCategery(id.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context)=>listOfProduct(id, name)));
        },
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage:NetworkImage(imageUrl) ,
              backgroundColor: Colors.grey,
            ),
            Text(title)
          ],
        ),
      ),

    );
  }
}
