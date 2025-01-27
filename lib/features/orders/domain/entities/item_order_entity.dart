import 'product_order_entity.dart';

class ItemOrderEntity {
  int id;
  int quantity;
  int price;
  int points;
  ProductOrderEntity product;

  ItemOrderEntity({
    required this.id,
    required this.quantity,
    required this.price,
    required this.points,
    required this.product,
  });
}
