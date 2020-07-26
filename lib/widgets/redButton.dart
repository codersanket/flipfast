import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main/pages/home.dart';

import '../values.dart';

class redButton extends StatelessWidget {
	final String string;
	final Function onTap;

  const redButton({this.string,this.onTap}) ;
  @override
  Widget build(BuildContext context) {
	  var height = MediaQuery.of(context).size.height;
	  var width = MediaQuery.of(context).size.width;
    return  Container(
	    width: width*0.8,
	    height: height*0.07,

	    child: RaisedButton(onPressed:onTap,child: Text(string,style: TextStyle(
		    color: Colors.white,
		    fontSize: 20,
	    ),),color: secondaryColor,),
    );
  }
}
