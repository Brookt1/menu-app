import 'package:equatable/equatable.dart';

class Option extends Equatable {
  final String id;
  final String name;
  final double price;

  const Option({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  List<Object?> get props => [id, name, price];
}
