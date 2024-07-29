class ShoeDetailEntity {
  final String id;
  final String date;
  final List<String> type;
  final List<int> quantity;
  final List<int> price;
  final String note;

  ShoeDetailEntity({
    required this.id,
    required this.date,
    required this.type,
    required this.quantity,
    required this.price,
    required this.note,
  });
}