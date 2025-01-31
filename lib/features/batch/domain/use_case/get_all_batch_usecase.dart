import 'package:dartz/dartz.dart';
import 'package:doko_platter/app/usecase/usecase.dart';
import 'package:doko_platter/core/error/failure.dart';
import 'package:doko_platter/features/batch/domain/entity/batch_entity.dart';
import 'package:doko_platter/features/batch/domain/repository/batch_repository.dart';

class GetAllBatchUseCase implements UsecaseWithoutParams<List<BatchEntity>> {
  final IBatchRepository batchRepository;

  GetAllBatchUseCase({required this.batchRepository});

  @override
  Future<Either<Failure, List<BatchEntity>>> call() {
    return batchRepository.getBatches();
  }
}
