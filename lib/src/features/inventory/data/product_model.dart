class DummyProduct {
  const DummyProduct({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  final int id;
  final String name;
  final int quantity;
  final double price;

  factory DummyProduct.fromJson(Map<String, dynamic> json) {
    return DummyProduct(
      id: json["no"] ?? 0,
      name: json["name"] ?? "",
      quantity: json["quantity"] ?? 0,
      price: json["price"] ?? 0.toDouble(),
    );
  }
}

var kProductList = [
  const DummyProduct(name: "Coca", id: 1, quantity: 32, price: 32.99),
];
