import 'package:dartz/dartz.dart';
import 'package:doko_platter/app/usecase/usease.dart';
import 'package:doko_platter/core/error/failure.dart';
import 'package:doko_platter/feature/Order/domain/entity/order_entity.dart';
import 'package:doko_platter/feature/Order/domain/repository/order_repository.dart';

class GetAllOrderUsecase implements UsecaseWithoutParams<List<OrderEntity>> {
  final IOrderRepository _orderRepository;

  GetAllOrderUsecase({required IOrderRepository orderRepository})
      : _orderRepository = orderRepository;

  @override
  Future<Either<Failure, List<OrderEntity>>> call() {
    return _orderRepository.getOrder();
  }

  // @override
  // Future<Either<Failure, List<OrderEntity>>> call() {
  //   return _orderRepository.getOrder();
  // }
}
