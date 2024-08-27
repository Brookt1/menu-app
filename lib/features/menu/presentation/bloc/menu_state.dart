part of 'menu_bloc.dart';

sealed class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

final class MenuInitial extends MenuState {}

final class LoadingState extends MenuState {}

final class MenuLoadedState extends MenuState {
  final List<Product> products;

  const MenuLoadedState({required this.products});
  @override
  List<Object> get props => products;
}

final class ErrorState extends MenuState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
