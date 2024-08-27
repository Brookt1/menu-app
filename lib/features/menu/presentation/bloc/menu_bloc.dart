import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/menu/domain/usecase/get_menu_items_usecase.dart';

import '../../domain/entities/product.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final GetMenuItemsUsecase getMenuItems;

  MenuBloc({required this.getMenuItems}) : super(MenuInitial()) {
    on<LoadAllMenuEvent>((event, emit) async {
      emit(LoadingState());

      final call = await getMenuItems();

      await call.fold(
        (failure) {
          emit(ErrorState(message: failure.message));
        },
        (data) async {
          await Future.delayed(const Duration(seconds: 2));

          emit(
            MenuLoadedState(
              products: data,
            ),
          );
        },
      );
    });
  }
}
