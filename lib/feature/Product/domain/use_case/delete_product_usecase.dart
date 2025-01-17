import 'package:dartz/dartz.dart';
import 'package:doko_platter_clean_architecture/app/usecase/usease.dart';
import 'package:doko_platter_clean_architecture/core/error/failure.dart';
import 'package:doko_platter_clean_architecture/feature/Product/domain/repository/product_repository.dart';
import 'package:equatable/equatable.dart';

class DeleteProductParams extends Equatable {
  final String productId;

  const DeleteProductParams({required this.productId});

  const DeleteProductParams.empty() : productId = '_empty.string';

  @override
  List<Object?> get props => [
        productId,
      ];
}

class DeleteProductUsecase
    implements UsecaseWithParams<void, DeleteProductParams> {
  final IProductRepository productRepository;

  DeleteProductUsecase({required this.productRepository});

  @override
  Future<Either<Failure, void>> call(DeleteProductParams params) async {
    return await productRepository.deleteProduct(params.productId);
  }
}
