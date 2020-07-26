import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:main/values.dart';

class card extends StatelessWidget {
  final String imageurl;
  final String title;
  final String price;
  final String percentage;
  final discountPrice;

  const card(
      {this.imageurl,
      this.title,
      this.price,
      this.discountPrice = '',
      this.percentage = ""});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      height: height * 0.3,
      width: width * 0.3,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            height: height * 0.15,
            child: Stack(
              children: [
                FadeInImage.assetNetwork(
                  image: imageurl,
                  placeholder: "assets/placeholder.png",
                ),
                Positioned(
                    right: 10,
                    child: Container(
                      height: height * 0.4,
                      decoration: BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text("-$percentage"),
                    ))
              ],
            ),
          ),
          Text(
            title,
            maxLines: 2,
          ),
          Row(
            children: [
              Text('₹' + price,
                  style: TextStyle(decoration: TextDecoration.lineThrough)),
              Text(
                '₹' + discountPrice,
                style: TextStyle(
                  fontSize: 20,
                  color: secondaryColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
