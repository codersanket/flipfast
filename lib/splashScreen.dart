import 'package:flutter/material.dart';
import 'package:main/values.dart';

class splashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
	  var height=MediaQuery.of(context).size.height;
	  var width= MediaQuery.of(context).size.width;
    return Scaffold(
	    backgroundColor: mainColor,
	    body: Padding(
	      padding: const EdgeInsets.all(15.0),
	      child: Container(
		      height:height,
	        child: Stack(

				    children: <Widget>[Center(child: Image.asset("assets/Asset 2xxxhdpi.png",fit: BoxFit.fill,)),

	Positioned(
		bottom: 30,
		left:width*0.35 ,
		child: Text("www.flipfast.in",style: TextStyle(
	  	color: Colors.black,
			fontWeight: FontWeight.bold
	  ),),
	)						    ]),
	      ),
	    ),
    );
  }
}
