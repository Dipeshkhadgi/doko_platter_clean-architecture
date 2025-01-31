import 'package:dartz/dartz.dart';
import 'package:doko_platter/core/error/failure.dart';
import 'package:doko_platter/features/batch/domain/entity/batch_entity.dart';

abstract interface class IBatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getBatches();
  Future<Either<Failure, void>> createBatch(BatchEntity batch);
  Future<Either<Failure, void>> deleteBatch(String id, String? token);
}


