import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/menu/presentation/bloc/menu_bloc.dart';
import 'package:grocery/features/menu/presentation/pages/menu_page.dart';
import 'package:grocery/injection_container.dart';

import 'package:grocery/core/config/route/route.dart' as route;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MenuBloc>(),
      child: const MaterialApp(
        home: MenuPage(),
        onGenerateRoute: route.controller,
        initialRoute: route.splashPage,
      ),
    );
  }
}
