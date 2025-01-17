import 'package:dartz/dartz.dart';
import 'package:doko_platter_clean_architecture/app/usecase/usease.dart';
import 'package:doko_platter_clean_architecture/core/error/failure.dart';
import 'package:doko_platter_clean_architecture/feature/order/domain/entity/order_entity.dart';
import 'package:doko_platter_clean_architecture/feature/order/domain/repository/order_repository.dart';


class GetAllOrderUsecase implements UsecaseWithoutParams<List<OrderEntity>> {
  final IOrderRepository _orderRepository;

  GetAllOrderUsecase({required IOrderRepository orderRepository})
      : _orderRepository = orderRepository;

  @override
  Future<Either<Failure, List<OrderEntity>>> call() {
    return _orderRepository.getOrder();
  }
}
