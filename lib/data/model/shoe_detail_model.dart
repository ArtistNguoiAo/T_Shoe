import 'package:e_medicine/domain/entity/shoe_detail_entity.dart';

class ShoeDetailModel extends ShoeDetailEntity {
  ShoeDetailModel({
    required super.id,
    required super.date,
    required super.type,
    required super.quantity,
    required super.price,
    required super.note,
  });

  factory ShoeDetailModel.fromJson(Map<String, dynamic> json) {
    return ShoeDetailModel(
      id: json['id'],
      date: json['date'],
      type: json['type'],
      quantity: json['quantity'],
      price: json['price'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'type': type,
      'quantity': quantity,
      'price': price,
      'note': note,
    };
  }
}