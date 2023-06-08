import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/model/cart_product_model.dart';
import 'package:furniture_e_commerce/model/sqflite/database_helper.dart';

class DbManager extends ChangeNotifier {
  List<CartProductModel> _product = [];
  List<CartProductModel> _availableProduct = [];

  late final DatabaseHelper _dbHelper;

  List<CartProductModel> get product => _product;
  List<CartProductModel> get availableProduct => _availableProduct;

  DbManager() {
    _dbHelper = DatabaseHelper();
    _getAllProduct();
  }

  void _getAllProduct() async {
    _product = await _dbHelper.getProduct();
    notifyListeners();
  }

  Future<void> getProductById(int id) async {
    _availableProduct = await _dbHelper.checkProductById(id);
    notifyListeners();
  }

  void addProduct(CartProductModel data) async {
    await _dbHelper.insertProduct(data);
    _getAllProduct();
  }

  void updateProduct(int id, int qty) async {
    await _dbHelper.updateProduct(id, qty);
    _getAllProduct();
  }

  void deleteProduct(int id) async {
    await _dbHelper.deleteProduct(id);
    _getAllProduct();
  }

  void deleteAllProduct() async {
    await _dbHelper.deleteAllProduct();
    notifyListeners();
  }
}
