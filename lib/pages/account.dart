import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main/values.dart';

class accountScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          tile(Icon(Icons.assignment,color: secondaryColor,), "Orders",null),
          tile(Icon(Icons.chat,color: secondaryColor,),"FAQ",null),
          tile(Icon(Icons.location_on,color: secondaryColor, ), "My Address",null),
          tile(Icon(Icons.headset_mic,color: secondaryColor,), "Help",null),
          tile(Icon(Icons.thumb_up,color: secondaryColor,), "Rate Us",null),
          tile(Icon(Icons.settings,color: secondaryColor,), "Account Setings",null),
          tile(null,"Sign Out",FaIcon(FontAwesomeIcons.signOutAlt,color: secondaryColor,))
        ],
      ),
    );
  }

  Widget tile(Icon icon,String text,FaIcon Faicon,){
    return Card(
      shadowColor: secondaryColor,
      elevation: 3,
      child: ListTile(

        leading: icon==null?Faicon:icon,
        trailing: Icon(Icons.arrow_forward_ios,color: secondaryColor,),
        title: Text(text,style: TextStyle(
          color: secondaryColor,

        ),),
      ),
    );
  }
}
