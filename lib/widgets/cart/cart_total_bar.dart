import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/screens/checkout/checkout_screen.dart';
import 'package:furniture_e_commerce/view/viewmodel/sqflite/db_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_formatter/money_formatter.dart';

class CartTotalBarWidget extends StatefulWidget {
  final DbManager manager;
  const CartTotalBarWidget({super.key, required this.manager});

  @override
  State<CartTotalBarWidget> createState() => _CartTotalBarWidgetState();
}

class _CartTotalBarWidgetState extends State<CartTotalBarWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.manager.product.isNotEmpty) {
      int total = 0;
      for (int i = 0; i < widget.manager.product.length; i++) {
        int totalPerQty =
            widget.manager.product[i].price! * widget.manager.product[i].qty!;
        total += totalPerQty;
      }

      MoneyFormatter fmf = MoneyFormatter(
        amount: total.toDouble(),
        settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: '. ',
          fractionDigits: 0,
        ),
      );

      MoneyFormatter fmf2 = MoneyFormatter(
        amount: (total + 20000).toDouble(),
        settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: '. ',
          fractionDigits: 0,
        ),
      );

      MoneyFormatterOutput fo = fmf.output;
      MoneyFormatterOutput fo2 = fmf2.output;

      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal :",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              Text(
                fo.symbolOnLeft,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Fee :",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              Text(
                "Rp. 20.000",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            height: 2,
            thickness: 2,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total :",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              Text(
                fo2.symbolOnLeft,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: whiteColor,
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
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
                        const CheckoutScreen(),
                  ),
                );
              },
              child: Text(
                "Checkout",
                style: GoogleFonts.poppins(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal :",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
            ),
            Text(
              "Rp. 0",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Fee :",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
            ),
            Text(
              "Rp. 0",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(
          height: 2,
          thickness: 2,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total :",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
            ),
            Text(
              "Rp. 0",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: blackColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: whiteColor,
              backgroundColor: backgroundColor2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Checkout",
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
