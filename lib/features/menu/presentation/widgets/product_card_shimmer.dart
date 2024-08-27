import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: 330,
          height: 250,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.grey[300],
              ),
              const SizedBox(height: 8), // Add spacing between elements
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Flexible(
                  child: Container(
                    height: 16,
                    width: double.infinity, // Adjust width as needed
                    color: Colors.grey[300],
                  ),
                ),
              ),
              const SizedBox(height: 8), // Add spacing between elements
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 16,
                        width: 50,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
