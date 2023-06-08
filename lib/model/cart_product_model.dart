class CartProductModel {
  int? id;
  int? productId;
  String? imageLink;
  String? name;
  String? category;
  String? material;
  int? price;
  int? qty;

  CartProductModel({
    this.id,
    this.productId,
    this.imageLink,
    this.name,
    this.category,
    this.material,
    this.price,
    this.qty,
  });

  Map<String, dynamic> qtyUpdatetoMap() {
    return {
      'qty': qty,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productId': productId,
      'imageLink': imageLink,
      'name': name,
      'category': category,
      'material': material,
      'price': price,
      'qty': qty,
    };
  }

  CartProductModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    productId = map['productId'];
    imageLink = map['imageLink'];
    name = map['name'];
    category = map['category'];
    material = map['material'];
    price = map['price'];
    qty = map['qty'];
  }
}
