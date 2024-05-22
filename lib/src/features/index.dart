import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marble/src/core/utils/size_utils.dart';
import 'package:marble/src/res/assets/app_assets.dart';
import 'package:marble/src/res/colors.dart';
import 'package:marble/src/res/topography/textstyles.dart';
import 'package:marble/src/shared/widgets/circular_avartar.dart';
import 'package:marble/src/shared/widgets/m_text.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                MarbleColors.deemWhite,
                MarbleColors.deemOrange,
                MarbleColors.deemOrange,
              ],
              stops: [
                0.25,
                0.7,
                1.0
              ]
          ),
        ),
    );
  }



}
