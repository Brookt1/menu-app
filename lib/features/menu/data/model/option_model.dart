import '../../domain/entities/option.dart';

class OptionModel extends Option {
  const OptionModel({
    required super.id,
    required super.name,
    required super.price,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
