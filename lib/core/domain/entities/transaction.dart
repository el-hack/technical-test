class Transaction {
  final int? id;
  final String description;
  final int amount;
  final String status;
  final String type;
  final String? createdAt;

  Transaction(
      { this.id,
      required this.description,
      required this.status,
      required this.type,
      required this.amount,
       this.createdAt});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      description: json['description'],
      status: json['status'],
      type: json['type'],
      amount: json['amount'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'amount': amount,
      'status': status,
      'type': type,
      'created_at': createdAt,
    };
  }
}
