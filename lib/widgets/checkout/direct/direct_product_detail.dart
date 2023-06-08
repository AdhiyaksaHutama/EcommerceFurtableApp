import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/model/cart_product_model.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DirectCheckoutProductListWidget extends StatefulWidget {
  final CartProductModel product;
  const DirectCheckoutProductListWidget({super.key, required this.product});

  @override
  State<DirectCheckoutProductListWidget> createState() =>
      _DirectCheckoutProductListWidgetState();
}

class _DirectCheckoutProductListWidgetState
    extends State<DirectCheckoutProductListWidget> {
  @override
  Widget build(BuildContext context) {
    final data = widget.product;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: backgroundColor2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              color: primaryColor,
            ),
            padding: const EdgeInsets.all(4),
            height: 100,
            width: 100,
            child: Image(
              image: AssetImage(
                data.imageLink!,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.name!,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: darkGreyColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: Text(
                          "Qty : ${data.qty!}",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                            color: darkGreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        "Category : ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 9,
                          color: darkGreyColor,
                        ),
                      ),
                      Text(
                        data.category!,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 9,
                          color: darkGreyColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Material : ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 9,
                          color: darkGreyColor,
                        ),
                      ),
                      Text(
                        data.material!,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 9,
                          color: darkGreyColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "Rp. ${data.price!}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: darkGreyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
