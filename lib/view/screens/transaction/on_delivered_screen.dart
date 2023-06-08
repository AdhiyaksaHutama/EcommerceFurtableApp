import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/utils/constant/transaction_model.dart';
import 'package:furniture_e_commerce/widgets/transaction/transaction_product_list.dart';

class OnDeliverScreen extends StatefulWidget {
  const OnDeliverScreen({super.key});

  @override
  State<OnDeliverScreen> createState() => _OnDeliverScreenState();
}

class _OnDeliverScreenState extends State<OnDeliverScreen> {
  List<TransactionProductModel> products = [
    TransactionProductModel(
        id: 'ji2iwa03nH2W',
        imageLink: 'assets/images/product_image.png',
        name: 'Blue Couch',
        category: 'Couch',
        material: 'Cotton',
        qty: '1',
        status: 'ondelivery')
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
