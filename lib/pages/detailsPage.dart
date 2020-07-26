import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:html/parser.dart';
import 'package:main/providers/product_provider.dart';
import 'package:main/widgets/searchDelegate.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:woocommerce/models/products.dart';
import 'package:flutter/src/widgets/image.dart' as image;

import '../values.dart';

class detailsPage extends StatefulWidget {
  final WooProduct wooProduct;
  detailsPage({this.wooProduct});

  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage>
    with TickerProviderStateMixin {
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    final _getProduct = Provider.of<getProducts>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.wooProduct.name),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: search());
              }),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Icon(Icons.shopping_cart),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.4,
                      child: Swiper(
                        itemCount: widget.wooProduct.images.length,
                        controller: SwiperController(),
                        pagination:
                            SwiperPagination(alignment: Alignment.bottomCenter),
                        itemBuilder: (context, index) {
                          return image.Image.network(
                              widget.wooProduct.images[index].src);
                        },
                      ),
                    ),
                    SmoothStarRating(
                      starCount: 5,
                      isReadOnly: true,
                      rating: widget.wooProduct.ratingCount.toDouble(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('₹' + widget.wooProduct.price,
                              style: TextStyle(
                                fontSize: 25,
                                color: secondaryColor,
                              )),
                          Text(
                            '₹' + widget.wooProduct.regularPrice,
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(parse(widget.wooProduct.shortDescription)
                          .documentElement
                          .text),
                    ),
                    Container(
                        height: height * 0.1,
                        child: TabBar(
                          isScrollable: true,
                          indicatorColor: secondaryColor,
                          labelColor: secondaryColor,
                          unselectedLabelColor: secondaryColor.withOpacity(0.5),
                          unselectedLabelStyle: TextStyle(),
                          tabs: [
                            Tab(
                              text: "Additional Information",
                            ),
                            Tab(
                              text: "Vendor Info",
                            ),
                            Tab(
                              text: "Reviews",
                            ),
                          ],
                          controller: _tabController,
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: height * 0.2,
                      child: TabBarView(
                        physics: PageScrollPhysics(),
                        children: [
                          addItionalInformation(),
                          vendorInfo(),
                          review()
                        ],
                        controller: _tabController,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: height*0.1,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: buttons(mainColor, "Add to Cart")),
                    Expanded(child: buttons(secondaryColor, "Buy Now"))
                  ],
                ),),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  Widget addItionalInformation() {
    return SingleChildScrollView(
        child: Text(parse(widget.wooProduct.description).documentElement.text));
  }

  Widget vendorInfo() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(widget.wooProduct.categories[index].name);
      },
      itemCount: widget.wooProduct.categories.length,
    );
  }

  Widget review() {
    return Text(widget.wooProduct.averageRating);
  }


  Widget buttons(Color color,String text){
    return Container(
      margin: EdgeInsets.all(3),
      color: color,
      child: Center(
        child: Text(text,style: TextStyle(
          color:color==mainColor?Colors.black:Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}

