import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/viewmodel/sqflite/db_manager.dart';
import 'package:furniture_e_commerce/widgets/cart/cart_list_view.dart';
import 'package:furniture_e_commerce/widgets/cart/cart_total_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

List<String> nameList = <String>['Tiara', 'Donny', 'Dimas', 'Cantika'];

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String dropdownValue = nameList[0];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            color: whiteColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Deliver to ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: blackColor,
                        ),
                      ),
                      PopupMenuButton<String>(
                        itemBuilder: (context) {
                          return nameList.map((str) {
                            return PopupMenuItem(
                              value: str,
                              child: Text(
                                str,
                              ),
                            );
                          }).toList();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              dropdownValue,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: blackColor,
                              ),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        onSelected: (v) {
                          setState(() {
                            dropdownValue = v;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer<DbManager>(
                    builder: (context, value, child) {
                      return CartListView(
                        manager: value,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    color: backgroundColor3,
                    child: Consumer<DbManager>(
                      builder: (context, manager, child) {
                        return CartTotalBarWidget(
                          manager: manager,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
