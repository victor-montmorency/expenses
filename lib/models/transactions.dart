class Transaction {
  final String id;
  final String tittle;
  final DateTime date;
  final double value;

  Transaction({
    required this.id,
    required this.value,
    required this.date,
    required this.tittle,
  });
}
