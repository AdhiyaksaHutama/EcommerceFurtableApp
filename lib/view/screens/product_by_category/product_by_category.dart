import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/widgets/home/product_grid.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductByCategoryScreen extends StatefulWidget {
  const ProductByCategoryScreen({super.key});

  @override
  State<ProductByCategoryScreen> createState() =>
      _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends State<ProductByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Couch Product",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: whiteColor,
          padding: const EdgeInsets.all(24),
          child: productGrid(),
        ),
      ),
    );
  }
}
