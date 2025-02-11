

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_api/Routs/route_names.dart';
import 'package:news_api/Screens/screen_category_view.dart';
import 'package:news_api/Screens/screen_home.dart';
import 'package:news_api/Screens/screen_onboard.dart';
import 'package:news_api/Screens/screen_web_view.dart';

class RouteServices {
  static Route onGenerteRoute(RouteSettings routename) {
    switch (routename.name) {
      case RouteNames.onBoard:
        return MaterialPageRoute(
          builder: (context) => ScreenOnboard(),
        );

      case RouteNames.home:
        return MaterialPageRoute(
          builder: (context) => ScreenHome(),
        );
          case RouteNames.categoryViewPage:
          final category = routename.arguments as String;
          log(category.toString());
          return MaterialPageRoute(builder: (context) => ScreenCategoryView(category: category),);
          case RouteNames.webView:
          final url=routename.arguments as String;
          return MaterialPageRoute(builder:  (context) => ScreenWebView(url: url),);
      default:
        return MaterialPageRoute(
          builder: (context) => SizedBox(),
        );
    }
  }
}
