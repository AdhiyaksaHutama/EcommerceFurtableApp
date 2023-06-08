import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/utils/constant/transaction_model.dart';
import 'package:furniture_e_commerce/widgets/transaction/transaction_status.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionProductList extends StatefulWidget {
  final List<TransactionProductModel> products;
  const TransactionProductList({super.key, required this.products});

  @override
  State<TransactionProductList> createState() => _TransactionProductListState();
}

class _TransactionProductListState extends State<TransactionProductList> {
  @override
  Widget build(BuildContext context) {
    if (widget.products.isNotEmpty) {
      final data = widget.products;
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 1,
                  color: backgroundColor2,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  height: 120,
                  width: 120,
                  color: primaryColor,
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
                                data[index].id!,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9,
                                  color: darkGreyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
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
                        Row(
                          children: [
                            Text(
                              "Qty : ",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: darkGreyColor,
                              ),
                            ),
                            Text(
                              data[index].qty!,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                                color: darkGreyColor,
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
                              child: TransactionStatusWidget(
                                  status: data[index].status!),
                            )),
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
        "No Product Yet !",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: darkGreyColor,
        ),
      ),
    );
  }
}
