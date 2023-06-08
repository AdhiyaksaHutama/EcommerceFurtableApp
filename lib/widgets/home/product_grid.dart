import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/screens/product_detail/product_detail.dart';
import 'package:google_fonts/google_fonts.dart';

Widget productGrid() {
  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 8,
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
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
                  const ProductDetailScreen(),
            ),
          );
        },
        child: Card(
          margin: const EdgeInsets.all(8),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: backgroundColor,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Image(
                    image: AssetImage(
                      'assets/images/product_image.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 4,
                ),
                child: Text(
                  "Nama Product",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: blackColor,
                    fontSize: 11,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "Category",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: blackColor,
                    fontSize: 9,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 8,
                  ),
                  child: Text(
                    "Rp.100.000",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: blackColor,
                      fontSize: 11,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
