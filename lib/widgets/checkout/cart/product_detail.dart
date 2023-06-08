import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/viewmodel/sqflite/db_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutProductListWidget extends StatefulWidget {
  final DbManager manager;
  const CheckoutProductListWidget({super.key, required this.manager});

  @override
  State<CheckoutProductListWidget> createState() =>
      _CheckoutProductListWidgetState();
}

class _CheckoutProductListWidgetState extends State<CheckoutProductListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.manager.product.isNotEmpty) {
      final data = widget.manager.product;
      return ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
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
                      data[index].imageLink!,
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
                              data[index].name!,
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
                                "Qty : ${data[index].qty!}",
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
                              data[index].category!,
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
                              data[index].material!,
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
                          "Rp. ${data[index].price!}",
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
        },
      );
    }
    return Center(
      child: Text(
        "No Product !",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: darkGreyColor,
        ),
      ),
    );
  }
}
