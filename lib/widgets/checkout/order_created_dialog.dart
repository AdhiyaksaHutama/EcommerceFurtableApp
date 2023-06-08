import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderCreatedDialog extends StatelessWidget {
  const OrderCreatedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Container(
        width: width,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 56,
            ),
            const Image(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/order_created.png'),
              width: 100,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Order Created",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: width / 1.4,
              child: Center(
                child: Text(
                  "Your Order has been processed, it will be sent to your address shortly.",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: width / 1.4,
              height: width / 9,
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: whiteColor,
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        {
                          final tweenFade = Tween(begin: 0.0, end: 1.0);
                          return FadeTransition(
                              opacity: animation.drive(tweenFade),
                              child: child);
                        }
                      },
                      pageBuilder: (context, animations, secondaryAnimations) =>
                          const HomeScreen(),
                    ),
                  );
                },
                child: Text(
                  "Confirm",
                  style: GoogleFonts.poppins(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
