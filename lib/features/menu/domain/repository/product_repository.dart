import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getMenuItems();

  Future<Either<Failure, Product>> getProductDetails(String productId);
}
