import 'package:flutter/material.dart';
import 'package:main/values.dart';

class textField extends StatelessWidget {
	final String hint;
	final TextEditingController textEditingController;
	textField({this.hint,this.textEditingController});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
      child: TextField(
	      controller:textEditingController ,
	      style: TextStyle(
		      color: secondaryColor
	      ),
	      cursorColor: secondaryColor,
	    decoration: InputDecoration(
		    contentPadding: EdgeInsets.all(8),
		    hintText: hint,
		    hintStyle: TextStyle(
			    color: secondaryColor
		    ),
		    enabledBorder: OutlineInputBorder(
			    borderSide: BorderSide(
				    color: secondaryColor,
				    width: 1
			    ),
		    ),

		    focusedBorder:OutlineInputBorder(
			    borderSide: BorderSide(
			    color: secondaryColor,
			    width: 1
	    ),
      ),

		    border: OutlineInputBorder( borderSide: BorderSide(
				    color: secondaryColor,
				    width: 1
		    ),)
	    ),

      ),
    );
  }
}
