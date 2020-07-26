import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:main/models/categery_model.dart';
import 'package:main/pages/detailsPage.dart';
import 'package:main/pages/listOfProduct2.dart';
import 'package:main/providers/cartProvider.dart';
import 'package:main/providers/product_provider.dart';
import 'package:main/widgets/cards.dart';
import 'package:main/widgets/category.dart';
import 'package:main/widgets/rowCategory.dart';
import 'package:provider/provider.dart';

class shopScreen extends StatefulWidget {
  @override
  _shopScreenState createState() => _shopScreenState();
}

class _shopScreenState extends State<shopScreen> {
  List<String> images1 = [
    "https://flipfast.in/wp-content/uploads/2020/04/flipfast-home-slider-banner-1.png",
    "https://flipfast.in/wp-content/uploads/2020/04/flipfast-home-slider-banner-2.png",
    "https://flipfast.in/wp-content/uploads/2020/04/flipfast-home-slider-banner-3.png",
    "https://flipfast.in/wp-content/uploads/2020/04/flipfast-home-slider-banner-4.png"
  ];
  List<categories_model> categories = [
    categories_model(
        158,"https://flipfast.in/wp-content/uploads/2020/01/14.jpg", "Fruits",),
    categories_model(217,
        "https://flipfast.in/wp-content/uploads/2020/01/4-1.jpg", "Vegetables"),
    categories_model(
        159,
        "https://flipfast.in/wp-content/uploads/2020/04/flipfast-home-slider-banner-1.png",
        "Daily Needs"),

    categories_model(
        156,
        "https://flipfast.in/wp-content/uploads/2020/01/cake-1850011_640.jpg",
        "Bakery"),
    categories_model(
        157,
        "https://flipfast.in/wp-content/uploads/2020/04/flipfast-home-slider-banner-2.png",
        "Egg,Meat & Fish"),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    final getProducts product = Provider.of<getProducts>(context);
    final cartProvider cart = Provider.of<cartProvider>(context);
    product.onSaleFunction();
    product.getDailyNeddProduct();
    final onsaleProduct = Provider.of<getProducts>(context).onSale;
    final dailyneed = Provider.of<getProducts>(context).dailyneedProduct;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: onsaleProduct.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  row(
                    cat: "Browse Categories",
                    buttonText: "View all",
                  ),
                  Container(
                    height: height * 0.15,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return category(
                          imageUrl: categories[index].url,
                          title: categories[index].title,
                          id: categories[index].id,
                          name: categories[index].title,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      height: height * 0.2,
                      child: Swiper(
                        itemCount: images1.length,
                        itemBuilder: (context, index) {
                          return FadeInImage.assetNetwork(
                            image: images1[index],
                            fit: BoxFit.contain,
                            placeholder: "assets/placeholder.png",
                          );
                        },
                        autoplay: true,
                        scrollDirection: Axis.horizontal,
                        pagination:
                            SwiperPagination(alignment: Alignment.bottomCenter),
                        controller: SwiperController(),
                      )),
                  row(
                    cat: "On Sale",
                    buttonText: "View all",
                    viewFunction: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                listOfProduct2(onsaleProduct, 'On Sale'))),
                  ),
                  Container(
                    height: height * 0.30,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => detailsPage(
                                        wooProduct: onsaleProduct[index],
                                      ))),
                          child: card(
                            imageurl: onsaleProduct[index].images[0].src,
                            title: onsaleProduct[index].name,
                            price: onsaleProduct[index].regularPrice,
                            discountPrice: onsaleProduct[index].price,
                          ),
                        );
                      },
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  row(
                    cat: "Daily Needs",
                    buttonText: "View all",
                    viewFunction: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                listOfProduct2(dailyneed, 'Daily Need'))),
                  ),
                  dailyneed == null
                      ? CircularProgressIndicator()
                      : Container(
                          height: height * 0.53,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, Index) {
                              Index = Index + 5;
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => detailsPage(
                                              wooProduct: dailyneed[Index],
                                            ))),
                                child: card(
                                  title: dailyneed[Index].name,
                                  imageurl: dailyneed[Index].images[0].src,
                                  discountPrice: dailyneed[Index].price,
                                  price: dailyneed[Index].regularPrice,
                                ),
                              );
                            },
                            itemCount: 4,
                          ),
                        )
                ],
              ),
            ),
    );
  }
}
