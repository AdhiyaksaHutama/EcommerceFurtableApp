import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/viewmodel/sqflite/db_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:provider/provider.dart';

class CartListView extends StatefulWidget {
  final DbManager manager;
  const CartListView({super.key, required this.manager});

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  Widget build(BuildContext context) {
    if (widget.manager.product.isNotEmpty) {
      final data = widget.manager.product;

      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          MoneyFormatter fmf = MoneyFormatter(
            amount: data[index].price!.toDouble(),
            settings: MoneyFormatterSettings(
              symbol: 'Rp',
              thousandSeparator: '.',
              decimalSeparator: ',',
              symbolAndNumberSeparator: '. ',
              fractionDigits: 0,
            ),
          );

          MoneyFormatterOutput fo = fmf.output;

          return Container(
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
                    height: 120,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          data[index].name!,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: darkGreyColor,
                          ),
                          overflow: TextOverflow.ellipsis,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              fo.symbolOnLeft,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: darkGreyColor,
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(
                                            "Delete from Cart ?",
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              color: darkGreyColor,
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                widget.manager.deleteProduct(
                                                    data[index].id!);
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Confirm",
                                                style: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Icon(
                                    Icons.delete_outline,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (widget.manager.product[index].qty! >
                                        1) {
                                      int minQty =
                                          widget.manager.product[index].qty! -
                                              1;

                                      context.read<DbManager>().updateProduct(
                                          widget.manager.product[index].id!,
                                          minQty);
                                    } else {
                                      //do nothing
                                    }
                                  },
                                  child: const Image(
                                    height: 24,
                                    fit: BoxFit.fitHeight,
                                    image: AssetImage(
                                        'assets/images/minus_button.png'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  data[index].qty!.toString(),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: darkGreyColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                  onTap: () async {
                                    int addQty =
                                        widget.manager.product[index].qty! + 1;
                                    context.read<DbManager>().updateProduct(
                                        widget.manager.product[index].id!,
                                        addQty);
                                  },
                                  child: const Image(
                                    height: 24,
                                    fit: BoxFit.fitHeight,
                                    image: AssetImage(
                                        'assets/images/plus_button.png'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
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
        "No Product Yet !",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: darkGreyColor,
        ),
      ),
    );
  }
}
