import '../../models/order_item.dart';

abstract class OrdersEvent {}

class SubmitOrdersEvent extends OrdersEvent {
  final OrderItem orderItem;

  SubmitOrdersEvent({
    required this.orderItem,
  });
}

