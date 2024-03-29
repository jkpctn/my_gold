import 'package:flutter/material.dart';
import 'package:my_gold/config/routes.dart';
import 'package:my_gold/presentation/add_buy_order_screen.dart';
import 'package:my_gold/presentation/add_sell_order_screen.dart';
import 'package:my_gold/presentation/display_buy_order_screen.dart';
import 'package:my_gold/presentation/display_sell_order_screen.dart';
import 'package:my_gold/presentation/edit_buy_order_screen.dart';
import 'package:my_gold/presentation/edit_sell_order_screen.dart';
import 'package:my_gold/presentation/home_screen.dart';
import 'package:my_gold/presentation/stat_screen.dart';
import 'package:my_gold/resource/data.dart';

import 'config/routes.dart';

void main() {
  runApp(MyApp());
}

// const MaterialColor primaryBlack = MaterialColor(
//   _blackPrimaryValue,
//   <int, Color>{
//     50: Color(0xFF000000),
//     100: Color(0xFF000000),
//     200: Color(0xFF000000),
//     300: Color(0xFF000000),
//     400: Color(0xFF000000),
//     500: Color(_blackPrimaryValue),
//     600: Color(0xFF000000),
//     700: Color(0xFF000000),
//     800: Color(0xFF000000),
//     900: Color(0xFF000000),
//   },
// );
// const int _blackPrimaryValue = 0xFF000000;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'THSarabunNew'),
      // routes: {
      //   AppRoutes.home: (context) => MyHomePage(),
      //   AppRoutes.showBuyOrder: (context) => DisplayBuyOrderScreen(),
      //   AppRoutes.addBuyOrder: (context) => AddBuyOrderScreen(),
      //   AppRoutes.editBuyOrder: (context) => EditBuyOrderScreen()
      // },
      onGenerateRoute: _registerRouteWithParameters,
      home: MyHomePage(),
    );
  }
}

Route _registerRouteWithParameters(RouteSettings settings) {
  if (settings.name == AppRoutes.showBuyOrder) {
    return MaterialPageRoute(builder: (context) {
      List<BuyOrder> args = settings.arguments;
      return DisplayBuyOrderScreen(
        orders: args,
      );
    });
  }
  if (settings.name == AppRoutes.showSellOrder) {
    return MaterialPageRoute(builder: (context) {
      List<SellOrder> args = settings.arguments;
      return DisplaySellOrderScreen(
        orders: args,
      );
    });
  }
  if (settings.name == AppRoutes.showStat) {
    return MaterialPageRoute(builder: (context) {
      StatArguments tmp = settings.arguments;
      return StatScreen(
        data: tmp,
      );
    });
  }
  if (settings.name == AppRoutes.addBuyOrder) {
    return MaterialPageRoute(builder: (context) {
      return AddBuyOrderScreen();
    });
  }
  if (settings.name == AppRoutes.editBuyOrder) {
    BuyOrder tmp = settings.arguments;
    return MaterialPageRoute(builder: (context) {
      return EditBuyOrderScreen(
        targetBuyOrder: tmp,
      );
    });
  }
  if (settings.name == AppRoutes.addSellOrder) {
    return MaterialPageRoute(builder: (context) {
      return AddSellOrderScreen();
    });
  }
  if (settings.name == AppRoutes.editSellOrder) {
    SellOrder tmp = settings.arguments;
    return MaterialPageRoute(builder: (context) {
      return EditSellOrderScreen(
        targetSellOrder: tmp,
      );
    });
  }
  return null;
}
