import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:main/values.dart';

class loadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
	    height: MediaQuery.of(context).size.height,
	    child: Center(
		    child: SpinKitChasingDots(
			    color: mainColor,
		    ),
	    ),
    );
  }
}
