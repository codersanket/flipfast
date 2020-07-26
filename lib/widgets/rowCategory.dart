import 'package:flutter/material.dart';

import '../values.dart';

class row extends StatelessWidget {

  final String  cat;
  final String buttonText;
  final Function viewFunction;

  const row({ this.cat, this.buttonText,this.viewFunction});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(cat,style: TextStyle(
            fontSize: 18
          ),),
          FlatButton(onPressed:viewFunction , child: Text("$buttonText>>",style: TextStyle(
              color: secondaryColor,
            fontSize: 18
          ),))
        ],
      ),
    );
  }
}
