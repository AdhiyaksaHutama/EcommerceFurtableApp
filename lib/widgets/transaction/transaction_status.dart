import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionStatusWidget extends StatelessWidget {
  final String status;
  const TransactionStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == 'ondelivery') {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: onDeliveryandCompletedColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 4,
          ),
          child: Text(
            "On Delivery",
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 11,
              color: onDeliveryandCompletedColor,
            ),
          ),
        ),
      );
    }
    if (status == 'completed') {
      return Container(
        decoration: BoxDecoration(
          color: onDeliveryandCompletedColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 4,
          ),
          child: Text(
            "Completed",
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 11,
              color: whiteColor,
            ),
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: secondaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 4,
        ),
        child: Text(
          "On Process",
          style: GoogleFonts.poppins(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 11,
            color: secondaryColor,
          ),
        ),
      ),
    );
  }
}
