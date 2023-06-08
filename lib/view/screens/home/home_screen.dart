import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/screens/cart/cart_screen.dart';
import 'package:furniture_e_commerce/view/screens/product_by_category/product_by_category.dart';
import 'package:furniture_e_commerce/widgets/bottom_navigation_bar/bottom_navbar.dart';
import 'package:furniture_e_commerce/widgets/home/category.dart';
import 'package:furniture_e_commerce/widgets/home/product_grid.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarComponent(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Container(
                    height: 310,
                    width: width,
                    color: primaryColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(16),
                              height: 36,
                              child: Form(
                                child: TextFormField(
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search),
                                    filled: true,
                                    contentPadding: const EdgeInsets.all(0),
                                    fillColor: whiteColor,
                                    hintText: "Search Furniture",
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 11,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
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
                                  pageBuilder: (context, animations,
                                          secondaryAnimations) =>
                                      const CartScreen(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              color: whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 16,
                          ),
                          child: Text(
                            "Hello, Tiara !",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: whiteColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 24,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Black Friday",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "80% OFF",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                    fontSize: 33,
                                  ),
                                ),
                                Text(
                                  "Discover amazing furnitures",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: whiteColor,
                                    fontSize: 9,
                                  ),
                                ),
                                Text(
                                  "for your need",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: whiteColor,
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Image(
                              width: 180,
                              fit: BoxFit.fitWidth,
                              image:
                                  AssetImage('assets/images/banner_image.png'),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: SizedBox(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: whiteColor,
                              backgroundColor: darkGreyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
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
                                  pageBuilder: (context, animations,
                                          secondaryAnimations) =>
                                      const ProductByCategoryScreen(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                "Order Now",
                                style: GoogleFonts.poppins(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              const CategoryWidget(),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Flash Sale !",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: blackColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                child: productGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
