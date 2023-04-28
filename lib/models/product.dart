class Product {
  Product({
    required this.id,
    required this.buyerUuid,
    required this.imageLink,
    required this.name,
    required this.price,
    required this.quantity,
    required this.sellerUuid,
  });

  String id;
  String buyerUuid;
  String imageLink;
  String name;
  int price;
  int quantity;
  String sellerUuid;
  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        buyerUuid: json["buyerUuid"],
        imageLink: json["imageLink"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        sellerUuid: json["sellerUuid"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "buyerUuid": buyerUuid,
        "imageLink": imageLink,
        "name": name,
        "price": price,
        "quantity": quantity,
        "sellerUuid": sellerUuid,
      };
}
