import 'package:flutter/cupertino.dart';
import 'package:main/pages/home.dart';
import 'package:main/pages/loginScreen.dart';
import 'package:main/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class wrapper extends StatefulWidget {



  @override
  _wrapperState createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {

  @override
  Widget build(BuildContext context) {
    final users=Provider.of<user>(context);
    users.fetchUser();
    final token=users.storeToken;
    return token==null ? loginScreen():home();
  }

}
