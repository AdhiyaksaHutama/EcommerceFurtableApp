import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/utils/constant/transaction_model.dart';
import 'package:furniture_e_commerce/widgets/transaction/transaction_product_list.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  List<TransactionProductModel> products = [
    TransactionProductModel(
        id: 'ji2iwa03nH2W',
        imageLink: 'assets/images/product_image.png',
        name: 'Blue Couch',
        category: 'Couch',
        material: 'Cotton',
        qty: '1',
        status: 'completed')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: whiteColor,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: TransactionProductList(products: products),
      ),
    );
  }
}
