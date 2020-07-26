import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:main/pages/registerScreen.dart';
import 'package:main/providers/user_provider.dart';
import 'package:main/providers/user_provider.dart';
import 'package:main/values.dart';
import 'package:main/widgets/loadingScreen.dart';
import 'package:main/widgets/redButton.dart';
import 'package:main/widgets/tetxField.dart';
import 'package:provider/provider.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {

	TextEditingController _username=TextEditingController();
	TextEditingController _password=TextEditingController();
	bool load=false;
	@override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final users=Provider.of<user>(context);
    return Scaffold(
      body: load?loadingScreen():SafeArea(
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
                              fit: BoxFit.fitHeight,
                            )),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Login",
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(
                  thickness: 3,
                  indent: 160,
                  endIndent: 160,
                  color: secondaryColor,
                ),
                textField(
                  hint: "Your Email",
	                textEditingController: _username,
                ),
                textField(
                  hint: "Your Password",
	                textEditingController: _password,
                ),
                Container(
	              padding: EdgeInsets.only(left: width*0.6),
                  child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
	                      decoration: TextDecoration.underline,
		                      color: secondaryColor,
	                      fontWeight: FontWeight.bold
                        ),
                      )),
                ),
	           redButton(string:"Login",onTap: (){
	           	users.loginUser(_username.text, _password.text);
	           	setState(() {
	           	  load=true;
	           	});

              },),
	              Container(
		            width: width*0.8,
	              padding: EdgeInsets.symmetric(vertical: 10),
	              child: Row(
		            children: [
		            	GestureDetector(
				            onTap:(){

				            	Navigator.push(context,MaterialPageRoute(builder: (context)=>registerScreenn()));
				            },
		            	  child: Text("not a member? Create an Account",style: TextStyle(
				            color: Colors.black,
				            fontWeight: FontWeight.w600

			            ),),
		            	),
		            ],
	              ),
	            ),
	            Text("OR",style: TextStyle(
		            color: secondaryColor,
		            fontWeight: FontWeight.bold
	            ),),
	            Text("Social Connect",style: TextStyle(
			            color: secondaryColor,
			            fontSize: 20,
			            fontWeight: FontWeight.w500,

	            ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
