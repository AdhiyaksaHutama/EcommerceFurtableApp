// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/model/cart_product_model.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/screens/cart/cart_screen.dart';
import 'package:furniture_e_commerce/view/screens/checkout/direct_checkout_screen.dart';
import 'package:furniture_e_commerce/view/viewmodel/sqflite/db_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    {
                      final tweenFade = Tween(begin: 0.0, end: 1.0);
                      return FadeTransition(
                          opacity: animation.drive(tweenFade), child: child);
                    }
                  },
                  pageBuilder: (context, animations, secondaryAnimations) =>
                      const CartScreen(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Container(
              color: whiteColor,
              height: constraints.maxHeight,
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        color: primaryColor,
                        padding: const EdgeInsets.all(16),
                        height: 280,
                        width: constraints.maxWidth,
                        child: const Image(
                          image: AssetImage('assets/images/product_image.png'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        width: constraints.maxWidth,
                        child: Text(
                          "Nama Product",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                              fontSize: 21),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 24),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: blackColor,
                              fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      border: Border.all(color: backgroundColor2),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Rp. 100.000",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: blackColor,
                              fontSize: 17),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.add_shopping_cart_outlined),
                          onPressed: () async {
                            try {
                              final CartProductModel data = CartProductModel(
                                  id: null,
                                  productId: 1,
                                  imageLink: "assets/images/product_image.png",
                                  name: "Blue Couch",
                                  category: "Couch",
                                  material: "Cotton",
                                  price: 100000,
                                  qty: 1);

                              await context.read<DbManager>().getProductById(1);

                              var availableData =
                                  context.read<DbManager>().availableProduct;

                              if (availableData.isNotEmpty) {
                                int newQty = availableData[0].qty! + 1;
                                context.read<DbManager>().updateProduct(
                                    availableData[0].id!, newQty);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content: Text("Added to Cart !"),
                                  ),
                                );
                              }
                              if (availableData.isEmpty) {
                                context.read<DbManager>().addProduct(data);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content:
                                        Text("Added New Product to Cart !"),
                                  ),
                                );
                                context.read<DbManager>().getProductById(1);
                              }
                            } on Exception {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Something went wrong"),
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: 120,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: whiteColor,
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              final CartProductModel data = CartProductModel(
                                  id: null,
                                  productId: 1,
                                  imageLink: "assets/images/product_image.png",
                                  name: "Blue Couch",
                                  category: "Couch",
                                  material: "Cotton",
                                  price: 100000,
                                  qty: 1);

                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    {
                                      final tweenFade =
                                          Tween(begin: 0.0, end: 1.0);
                                      return FadeTransition(
                                          opacity: animation.drive(tweenFade),
                                          child: child);
                                    }
                                  },
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return DirectCheckoutScreen(
                                      product: data,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Buy Now",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
