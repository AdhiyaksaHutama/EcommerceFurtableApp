import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/viewmodel/sqflite/db_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_formatter/money_formatter.dart';

class CheckoutPaymentDetails extends StatelessWidget {
  final DbManager manager;
  const CheckoutPaymentDetails({super.key, required this.manager});

  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (int i = 0; i < manager.product.length; i++) {
      int totalPerQty = manager.product[i].price! * manager.product[i].qty!;
      total += totalPerQty;
    }

    MoneyFormatter subtotalfmf = MoneyFormatter(
      amount: total.toDouble(),
      settings: MoneyFormatterSettings(
        symbol: 'Rp',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: '. ',
        fractionDigits: 0,
      ),
    );

    MoneyFormatter taxfmf = MoneyFormatter(
      amount: total * 0.1,
      settings: MoneyFormatterSettings(
        symbol: 'Rp',
        thousandSeparator: '.',
        decimalSeparator: ',',
        symbolAndNumberSeparator: '. ',
        fractionDigits: 0,
      ),
    );

    MoneyFormatterOutput foSubtotal = subtotalfmf.output;
    MoneyFormatterOutput foTax = taxfmf.output;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: backgroundColor2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
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
                foSubtotal.symbolOnLeft,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tax (10%) :",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              Text(
                foTax.symbolOnLeft,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
