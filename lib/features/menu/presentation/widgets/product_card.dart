import 'package:flutter/material.dart';
import 'package:grocery/features/menu/domain/entities/product.dart';
import 'package:grocery/features/menu/presentation/widgets/favorite_button.dart';

import 'custom_text.dart';
import 'image_loader.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Container(
        width: 350,
        height: 220,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                imageLoader(product.imageUrl),
                const Positioned(
                  right: 0,
                  child: FavoriteButton.favoriteButton(
                    iconColor: Color(0xFFFF6347),
                  ),
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  CustomText(
                    text: product.title,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow[700],
                  ),
                  CustomText(
                    text: product.rating.toString(),
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  if (product.discount > 0)
                    CustomText(
                      text: '£ ${product.price.toString()}',
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomText(
                    text: '£ ${product.price - product.discount}',
                    color: const Color(0xFFFF6347),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
