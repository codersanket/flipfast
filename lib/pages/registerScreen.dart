import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:main/pages/home.dart';
import 'package:main/providers/user_provider.dart';
import 'package:main/widgets/loadingScreen.dart';
import 'package:main/widgets/redButton.dart';
import 'package:main/widgets/tetxField.dart';
import 'package:provider/provider.dart';

import '../values.dart';

class registerScreenn extends StatefulWidget {
  @override
  _registerScreennState createState() => _registerScreennState();
}

class _registerScreennState extends State<registerScreenn> {

  TextEditingController first_name=TextEditingController();
  TextEditingController last_name=TextEditingController();
  TextEditingController _username=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();

  var _radioValue = 0;
  radioHandler(int val) {
    setState(() {
      _radioValue = val;

      switch (val) {
        case 0:
          print("Customer");
          break;
        case 1:
          print("Vendor");
          break;
      }
    });
  }
var loading=false;
  @override
  Widget build(BuildContext context) {
    final customer=Provider.of<user>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return customer.storeToken!=null?home():Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: DiagonalPathClipperTwo(),
                      child: Container(
                        height: height * 0.30,
                        color: secondaryColor,
                      ),
                    ),
                    ClipPath(
                      clipper: DiagonalPathClipperTwo(),
                      child: Container(
                        height: height * 0.28,
                        width: width,
                        color: mainColor,
                        child: Container(
                            padding: EdgeInsets.all(80),
                            child: Image.asset(
                              "assets/Asset 1xxxhdpi.png",
                              fit: BoxFit.contain,
                            )),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Register",
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  thickness: 3,
                  indent: 140,
                  endIndent: 140,
                  color: secondaryColor,
                ),
                textField(
                  hint: "First Name",textEditingController: first_name,
                ),
                textField(
                  hint: "Last Name",textEditingController: last_name,
                ),
                textField(
                  hint: "Username",textEditingController: _username,
                ),
                textField(
                  hint: "Email",textEditingController: _email,
                ),
                textField(
                  hint: "Password",textEditingController: _password,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            onChanged: (val) {
                              radioHandler(val);
                            },
                            groupValue: _radioValue,
                            activeColor: secondaryColor,
                            focusColor: mainColor,
                          ),
                          Text(
                            "I am a customer",
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: (val) {
                              radioHandler(val);
                            },
                            activeColor: secondaryColor,
                            focusColor: mainColor,
                          ),
                          Text(
                            "I am a vendor",
                            style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
	              redButton(string:"REGISTER",onTap: (){
	                setState(() {
	                  loading=true;
	                });
	                customer.registerUser2(first_name.text,last_name.text,_username.text,_email.text,_password.text);
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
