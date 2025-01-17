import 'package:dartz/dartz.dart';
import 'package:doko_platter_clean_architecture/app/usecase/usease.dart';
import 'package:doko_platter_clean_architecture/core/error/failure.dart';
import 'package:doko_platter_clean_architecture/feature/order/domain/entity/order_entity.dart';
import 'package:doko_platter_clean_architecture/feature/order/domain/repository/order_repository.dart';
import 'package:equatable/equatable.dart';

class CreateOrderParams extends Equatable {
  final String orderName;

  const CreateOrderParams({required this.orderName});

  // Empty constructor
  const CreateOrderParams.empty() : orderName = '_empty.string';

  @override
  List<Object?> get props => [orderName];
}

class CreateOrderUsecase implements UsecaseWithParams<void, CreateOrderParams> {
  final IOrderRepository _orderRepository;

  CreateOrderUsecase({required IOrderRepository orderRepository})
      : _orderRepository = orderRepository;

  @override
  Future<Either<Failure, void>> call(CreateOrderParams params) {
    return _orderRepository.createOrder(
      OrderEntity(orderName: params.orderName),
    );
  }
}
