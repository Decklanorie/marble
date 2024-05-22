
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/assets/app_assets.dart';
import '../../../res/colors.dart';
import '../../../shared/radar_painters.dart';

class FAB extends StatefulWidget {
   FAB({super.key, required this.icon, this.onTap, required this.canTap});
  String icon;
  Function()? onTap;
  bool canTap;

  @override
  State<FAB> createState() => _FABState();
}

class _FABState extends State<FAB> {
  bool _animationEnded = false;
  bool step2 = true;
  bool step3 = true;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child:Stack(
      children: [
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.2, end: 1.0),
            duration: Duration(milliseconds: 800),
            onEnd: () {
              setState(() {
                _animationEnded = true;
              });
            },
            builder: (context, double value, child) =>
                Transform.scale(
                    scale: value,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: MarbleColors.deemGrey,
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      child: Center(
                        child: Container(
                          width: 18,
                          child: SvgPicture.asset(widget.icon,color: MarbleColors.deemWhite,),
                        ),
                      ),
                    )
                )
        ),

        if(widget.canTap&&_animationEnded)if(!step2) TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 1.0, end: 0.6),
          duration: Duration(milliseconds: 100),
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

        if(widget.canTap&&_animationEnded)if(step2) if(!step3)TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.6, end: 1.0),
          duration: Duration(milliseconds: 100),
          onEnd: () {
            setState(() {
              step3 = true;
            });
            widget.onTap?.call();
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

        if(widget.canTap&&_animationEnded)if(!step2) TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.6, end: 1.0),
          duration: Duration(milliseconds: 100),
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
    ),
      onTap: (){
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
