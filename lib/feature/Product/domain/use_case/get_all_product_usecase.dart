import 'package:dartz/dartz.dart';
import 'package:doko_platter/app/usecase/usease.dart';
import 'package:doko_platter/core/error/failure.dart';
import 'package:doko_platter/feature/Product/domain/entity/product_entity.dart';
import 'package:doko_platter/feature/Product/domain/repository/product_repository.dart';

class GetAllProductUseCase
    implements UsecaseWithoutParams<List<ProductEntity>> {
  final IProductRepository productRepository;

  GetAllProductUseCase({required this.productRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>> call() {
    return productRepository.getProduct();
  }
}
