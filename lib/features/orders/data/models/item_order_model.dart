import 'package:app_ventas/features/orders/data/models/models.dart';
import 'package:app_ventas/features/orders/domain/entities/entities.dart';

class ItemOrderModel extends ItemOrderEntity {
  ItemOrderModel(
      {required super.id,
      required super.quantity,
      required super.price,
      required super.points,
      required super.product});

  factory ItemOrderModel.fromJson(Map<String, dynamic> json) {
    return ItemOrderModel(
      id: json['id'],
      quantity: json['quantity'],
      price: json['price'],
      points: json['points'],
      product: ProductOrderModel.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'price': price,
      'points': points,
      'product': (product as ProductOrderModel).toJson(),
    };
  }
}
