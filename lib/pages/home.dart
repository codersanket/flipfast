import 'package:flutter/material.dart';
import 'package:main/main.dart';
import 'package:main/pages/account.dart';
import 'package:main/pages/cartPage.dart';
import 'package:main/pages/more.dart';
import 'package:main/pages/shop.dart';
import 'package:main/pages/wishlist.dart';
import 'package:main/values.dart';
import 'package:main/widgets/drawer.dart';
import 'package:main/widgets/searchDelegate.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int index = 0;
  List<Widget> _pages = [
    shopScreen(),
    wishlistScreen(),
    accountScreen(),
    moreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SafeArea(
          child: Drawer(
            elevation: 16,
            semanticLabel: "Sanket",
            child: drawer(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: mainColor,
          iconTheme: IconThemeData(color: secondaryColor),
          title: Container(
              height: kBottomNavigationBarHeight - 20,
              child: Image.asset("assets/Asset 1xxxhdpi.png")),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: secondaryColor,
                ),
                onPressed: () {}),
            IconButton(icon: Icon(Icons.search,color: secondaryColor,), onPressed:()=>showSearch(context: context, delegate:search()))
          ],
        ),
        body: _pages[index],
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.shop,
                        size: 30,
                        color: secondaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                    ),
                    Text(
                      "Shop",
                      style: TextStyle(color: secondaryColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                        color: secondaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                    ),
                    Text(
                      "Wish List",
                      style: TextStyle(color: secondaryColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        size: 30,
                        color: secondaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                    ),
                    Text(
                      "Account",
                      style: TextStyle(color: secondaryColor),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                        color: secondaryColor,
                      ),
                      onPressed: () {
                        setState(() {
                          index = 3;
                        });
                      },
                    ),
                    Text(
                      "More",
                      style: TextStyle(color: secondaryColor),
                    )
                  ],
                ),
              )
            ],
          ),
          shape: CircularNotchedRectangle(),
          notchMargin: 0,
          color: mainColor,
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Sanket",
          backgroundColor: secondaryColor,
          onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartPage())),
          child: Icon(
            Icons.shopping_cart,
            color: mainColor,
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
