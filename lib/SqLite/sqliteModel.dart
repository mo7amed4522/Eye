// ignore_for_file: file_names
class Checkout {
  final int? id;
  final String name;
  final String contry;
  final String cardName;
  final String? cardExpiration;
  final int? cvv;

  Checkout({
    this.id,
    required this.name,
    required this.contry,
    required this.cardName,
    this.cardExpiration,
    this.cvv,
  });

  Checkout.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        contry = res["contry"],
        cardName = res["cardName"],
        cardExpiration = res["cardExpiration"],
        cvv = res["cvv"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'contry': contry,
      'cardName': cardName,
      'cardExpiration': cardExpiration,
      "cvv": cvv,
    };
  }
}
