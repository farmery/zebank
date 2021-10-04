class Transaction {
  String amount;
  TransactionType type;
  DateTime time;
  String title;
  Status status;

  Transaction(
      {required this.amount,
      required this.time,
      required this.title,
      required this.type,
      required this.status});
}

enum TransactionType { credit, debit }
enum Status { successful, failed, pending }
