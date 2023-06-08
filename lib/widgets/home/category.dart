import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/screens/product_by_category/product_by_category.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            InkWell(
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
                        const ProductByCategoryScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 48,
                height: 48,
                child: const Image(
                  image: AssetImage('assets/images/noto_chair.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Chair",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: blackColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
        Column(
          children: [
            InkWell(
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
                        const ProductByCategoryScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 48,
                height: 48,
                child: const Image(
                  image: AssetImage('assets/images/noto_door.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Door",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: blackColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
        Column(
          children: [
            InkWell(
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
                        const ProductByCategoryScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 48,
                height: 48,
                child: const Image(
                  image: AssetImage('assets/images/noto_couch-and-lamp.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Couch",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: blackColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
        Column(
          children: [
            InkWell(
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
                        const ProductByCategoryScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 48,
                height: 48,
                child: const Image(
                  image: AssetImage('assets/images/noto_bed.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Bed",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: blackColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
