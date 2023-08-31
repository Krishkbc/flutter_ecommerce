import 'package:e_commerce/bloc/bloc/cart_bloc/cart_bloc.dart';
import 'package:e_commerce/config/app_router.dart';
import 'package:e_commerce/config/theme.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:e_commerce/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc/wishlist_bloc/wishlist_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WishlistBloc()..add(StartWishlist()),
        ),
        BlocProvider(
          create: (context) => CartBloc()..add(CartStarted()),
        )
      ],
      child: const MaterialApp(
          title: 'Flutter Demo',
          // theme:theme(),
          onGenerateRoute: AppRoute.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
          home: HomeScreen()),
    );
  }
}
