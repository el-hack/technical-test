class Transaction {
  final int id;
  final String title;
  final double amount;
  final String date;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date,
    };
  }
}
