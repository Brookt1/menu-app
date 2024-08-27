import '../../domain/entities/product.dart';
import 'option_model.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.rating,
    required super.price,
    required super.discount,
    required super.description,
    required List<OptionModel> super.options,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      rating: json['rating'].toDouble(),
      price: json['price'].toDouble(),
      discount: json['discount'].toDouble(),
      description: json['description'],
      options: (json['options'] as List)
          .map((optionJson) => OptionModel.fromJson(optionJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'rating': rating,
      'price': price,
      'discount': discount,
      'description': description,
      'options':
          options.map((option) => (option as OptionModel).toJson()).toList(),
    };
  }

  Product toEntity() => Product(
      id: id,
      title: title,
      imageUrl: imageUrl,
      rating: rating,
      price: price,
      discount: discount,
      description: description,
      options: options);
}
