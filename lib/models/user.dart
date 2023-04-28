import 'dart:convert';

class User {
    User({
        required this.email,
        required this.name,
        required this.id,
        required this.mobile,
        required this.orderHistory,
    });

    String email;
    String name;
    String id;
    String mobile;
    List<String> orderHistory;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"],
        name: json["name"],
        id: json["id"],
        mobile: json["mobile"],
        orderHistory: List<String>.from(json["orderHistory"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
        "id": id,
        "mobile": mobile,
        "orderHistory": List<dynamic>.from(orderHistory.map((x) => x)),
    };
}
