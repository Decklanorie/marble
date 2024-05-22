import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marble/src/res/colors.dart';

import '../../res/assets/app_assets.dart';
import '../radar_painters.dart';

class BottomNavItem extends StatefulWidget {
   BottomNavItem({super.key, required this.onTap, required this.icon, required this.index,
     required this.isActive, this.reverseTap});
  bool isActive;
  Function() onTap;
  Function()? reverseTap;
  String icon;
  int index;

  @override
  State<BottomNavItem> createState() => _BottomNavItemState();
}

class _BottomNavItemState extends State<BottomNavItem> {
  bool step2 = false;
  bool step3 = false;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: MarbleColors.transparent,
            shape: BoxShape.circle,
          ),
          child:Stack(
            children: [

              Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color:widget.isActive && step3? MarbleColors.orange: MarbleColors.transparent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: widget.isActive && step3? MarbleColors.orange:MarbleColors.black3,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                            width: widget.icon==MarbleAssets.house?25:20,
                            height: widget.icon==MarbleAssets.house?25:20,
                            decoration: BoxDecoration(
                              color: MarbleColors.transparent,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(widget.icon,color: MarbleColors.white,)
                        ),
                      )
                  ),
              ),

              if(widget.isActive) if(!step2) TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1.0, end: 0.6),
                duration: Duration(milliseconds: 200),
                onEnd: () {
                  setState(() {
                    step2 = true;
                  });
                },
                builder: (context, value, child) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: MarbleColors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: CustomPaint(
                      painter: RadarPainter(value),
                    ),
                  );
                },
              ),

              if(widget.isActive)if(step2) if(!step3)TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.6, end: 1.0),
                duration: Duration(milliseconds: 200),
                onEnd: () {
                  if(widget.index==0){
                    if(Platform.isAndroid){
                      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                        systemNavigationBarColor: MarbleColors.deemOrange,
                        statusBarIconBrightness: Brightness.dark,
                        systemNavigationBarIconBrightness: Brightness.dark,
                      ));
                    }
                  }else if(widget.index==1){
                    if(Platform.isAndroid){
                      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                        systemNavigationBarColor: MarbleColors.black2,
                        statusBarIconBrightness: Brightness.light,
                        systemNavigationBarIconBrightness: Brightness.light,
                      ));
                    }
                  }
                  setState(() {
                    step3 = true;
                  });
                  widget.onTap.call();
                },
                builder: (context, value, child) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: MarbleColors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: CustomPaint(
                      painter: RadarPainter(value),
                    ),
                  );
                },
              ),

              if(widget.isActive)if(!step2) TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.6, end: 1.0),
                duration: Duration(milliseconds: 200),
                onEnd: () {
                },
                builder: (context, value, child) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: MarbleColors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: CustomPaint(
                      painter: RadarPainter2(value),
                    ),
                  );
                },
              ),
            ],
          )
      ),
      onTap: (){
        widget.reverseTap?.call();
        if(step2){
          setState(() {
            step2=false;
            step3=false;
          });
        }
          },
    );
  }
}

