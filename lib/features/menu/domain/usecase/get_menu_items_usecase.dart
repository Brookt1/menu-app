import 'package:dartz/dartz.dart';
import 'package:grocery/core/error/failure.dart';
import 'package:grocery/features/menu/domain/entities/product.dart';

import '../repository/product_repository.dart';

class GetMenuItemsUsecase {
  final ProductRepository productRepository;

  GetMenuItemsUsecase({required this.productRepository});

  Future<Either<Failure, List<Product>>> call() async {
    return await productRepository.getMenuItems();
  }
}
