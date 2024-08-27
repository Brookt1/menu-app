import 'package:dartz/dartz.dart';
import 'package:grocery/core/network/network_info.dart';
import 'package:grocery/features/menu/domain/repository/product_repository.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/product.dart';
import '../data_source/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final NetworkInfo networkInfo;
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl(
      {required this.networkInfo, required this.productRemoteDataSource});
  @override
  Future<Either<Failure, List<Product>>> getMenuItems() async {
    if (await networkInfo.isConnected) {
      try {
        final products = await productRemoteDataSource.getMenuItems();
        return Right(products.map((product) => product.toEntity()).toList());
      } on ServerException {
        return const Left(ServerFailure('An error has occurred'));
      }
    } else {
      return const Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetails(String productId) {
    // TODO: implement getProductDetails
    throw UnimplementedError();
  }
}
