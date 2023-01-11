import 'package:alchemy_coffee_lab/Provider/dark_theme_provider.dart';
import 'package:alchemy_coffee_lab/inner_screens/product_details.dart';
import 'package:alchemy_coffee_lab/screens/auth/login.dart';
import 'package:alchemy_coffee_lab/screens/auth/register.dart';
import 'package:alchemy_coffee_lab/screens/btm_bar.dart';
import 'package:alchemy_coffee_lab/inner_screens/feeds_screen.dart';
import 'package:alchemy_coffee_lab/screens/home.dart';
import 'package:alchemy_coffee_lab/screens/orders/orders_screen.dart';
import 'package:alchemy_coffee_lab/screens/viewed_recently/viewed_recently.dart';
import 'package:alchemy_coffee_lab/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'consts/theme_data.dart';
import 'inner_screens/on_sale_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const LoginScreen(),
            routes: {
              OnSaleScreen.routeName: (context) => const OnSaleScreen(),
              FeedsScreen.routeName: (context) => const FeedsScreen(),
              ProductDetails.routeName: (context) => const ProductDetails(),
              WishlistScreen.routeName: (context) => const WishlistScreen(),
              OrdersScreen.routeName: (ctx) => const OrdersScreen(),
              ViewedRecently.routeName: (ctx) => const ViewedRecently(),
              RegisterScreen.routeName: (ctx) => const RegisterScreen(),
              LoginScreen.routeName: (ctx) => const LoginScreen(),
            },
          );
        },
      ),
    );
  }
}
