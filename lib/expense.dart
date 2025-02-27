class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  String? category;
  Expense(
      {required this.amount,
      required this.title,
      required this.id,
      required this.date,
      this.category});
}
