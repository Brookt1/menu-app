import 'package:flutter/material.dart';
import 'package:grocery/features/menu/presentation/pages/detail_page.dart';

import '../../../features/menu/presentation/pages/menu_page.dart';
import '../../../features/menu/presentation/pages/splash_page.dart';

const String menuPage = 'menu';
const String detailPage = 'detail';
const String searchPage = 'search';
const String splashPage = 'splash';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case detailPage:
      final args = settings.arguments as Map<String, dynamic>?;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProductDetailPage(
          product: args?['product'],
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );
    case splashPage:
      return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SplashPage());

    // case searchPage:
    //   return PageRouteBuilder(
    //     pageBuilder: (context, animation, secondaryAnimation) =>
    //         const SearchPage(),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       var begin = const Offset(1.0, 0.0);
    //       var end = Offset.zero;
    //       var curve = Curves.ease;

    //       var tween =
    //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    //       var offsetAnimation = animation.drive(tween);

    //       return SlideTransition(
    //         position: offsetAnimation,
    //         child: child,
    //       );
    //     },
    //   );

    case menuPage:
    default:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MenuPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );
  }
}
