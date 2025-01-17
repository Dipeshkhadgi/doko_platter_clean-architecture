
import 'package:doko_platter_clean_architecture/feature/order/domain/entity/order_entity.dart';

abstract interface class IOrderDataSource {
  Future<List<OrderEntity>> getOrder();
  Future<void> createOrder(OrderEntity order);
  Future<void> deleteOrder(String id);
}
