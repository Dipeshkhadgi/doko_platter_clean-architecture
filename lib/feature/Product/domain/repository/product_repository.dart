

import 'package:dartz/dartz.dart';
import 'package:doko_platter_clean_architecture/core/error/failure.dart';
import 'package:doko_platter_clean_architecture/feature/Product/domain/entity/product_entity.dart';

abstract interface class IProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProduct();
  Future<Either<Failure, void>> createProduct(ProductEntity product);
  Future<Either<Failure, void>> deleteProduct(String id);
}
