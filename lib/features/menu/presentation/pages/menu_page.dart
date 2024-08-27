import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/menu/presentation/bloc/menu_bloc.dart';
import 'package:grocery/features/menu/presentation/widgets/custom_text.dart';
import 'package:grocery/features/menu/presentation/widgets/product_card.dart';
import 'package:grocery/features/menu/presentation/widgets/search_text_filed.dart';

import '../widgets/product_card_shimmer.dart';
import 'package:grocery/core/config/route/route.dart' as route;

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    context.read<MenuBloc>().add(LoadAllMenuEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MenuBloc, MenuState>(
      listener: (context, state) {
        if (state is MenuLoadedState) {
          // Handle loaded state
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/burger.png'),
                    const SizedBox(width: 12),
                    const CustomText(
                      text: 'Burger',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SearchTextField(),
                Expanded(
                  child: BlocBuilder<MenuBloc, MenuState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return const ProductCardShimmer();
                          },
                        );
                      } else if (state is MenuLoadedState) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                          ),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, route.detailPage,
                                    arguments: <String, dynamic>{
                                      'product': state.products[index]
                                    });
                              },
                              child:
                                  ProductCard(product: state.products[index]),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text("Failed to load menu"));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
