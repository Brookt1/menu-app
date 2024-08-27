import 'package:flutter/material.dart';

Widget imageLoader(url, {double height = 100}) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    child: Image.network(
      url,
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        }
      },
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return const Center(
            child: Text('Failed to load image',
                style: TextStyle(color: Colors.red)));
      },
    ),
  );
}
