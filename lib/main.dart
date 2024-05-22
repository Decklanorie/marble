import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marble/src/core/utils/size_utils.dart';
import 'package:marble/src/res/colors.dart';

import 'app_go_router.dart';

void main() {
  if(Platform.isAndroid){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MarbleColors.transparent,
      systemNavigationBarColor: MarbleColors.deemOrange,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

    runApp(const MyApp());

  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp.router(
            routerConfig: router,
          );
        });
  }
}
