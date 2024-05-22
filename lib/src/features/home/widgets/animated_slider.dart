import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marble/src/core/utils/size_utils.dart';
import 'package:marble/src/res/colors.dart';
import 'package:marble/src/res/topography/textstyles.dart';
import 'package:marble/src/shared/widgets/m_text.dart';

class AnimatedSliderButton extends StatefulWidget {
  const AnimatedSliderButton({super.key, required this.title,
    required this.width, required this.small});
  final String title;
  final double width;
  final bool small;

  @override
  State<AnimatedSliderButton> createState() => _AnimatedSliderButtonState();
}

class _AnimatedSliderButtonState extends State<AnimatedSliderButton> with TickerProviderStateMixin {
  late Tween<double> animation;
  late Tween<double> animation2;
  late Tween<double> animation4;
  bool animationHasEnded = false;
  bool wait = true;
  bool wait2 = true;

  @override
  void initState() {
    animation = Tween<double>(begin: 0, end: widget.width);
    animation2 = Tween<double>(begin: 0.3, end: 1.0);
    animation4 = Tween<double>(begin: 0.3, end: 1.0);
    Timer(Duration(milliseconds: 300), () {
      setState(() {
        wait = false;
      });
      Timer(Duration(milliseconds: 300), () {
        setState(() {
          wait2 = false;
        });
        animation2.animate(AnimationController(duration: Duration(milliseconds: 400), vsync: this));
      });
      animation.animate(AnimationController(duration: Duration(milliseconds: 600), vsync: this));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return wait?SizedBox.shrink():
        wait2?
        Container(
            height: widget.small?40:48,
            width: widget.small?40:48,
            child:Center(
              child: TweenAnimationBuilder(
                  tween: animation2,
                  duration: Duration(milliseconds: 400),
                  builder: (context, double value, child) =>
                      Transform.scale(
                        scale: value,
                        child: Container(
                          height: widget.small?40:48,
                          width: widget.small?40:48,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10000),
                            color: MarbleColors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_forward_ios, size: 13,),
                          ),
                        ),
                      )
              ),
            )):
    TweenAnimationBuilder(
      tween: animation,
      duration: Duration(milliseconds: 600),
      builder: (context, double value, child) =>
          Container(
              height: widget.small?40:48,
              width: value<(widget.small?40:48)?(widget.small?40:48):value,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10000),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10000),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if(!animationHasEnded)addHorizontalSpace(0),
                        if(animationHasEnded)addHorizontalSpace(10),
                        if(animationHasEnded)Flexible(
                            child:TweenAnimationBuilder(
                          tween: animation4,
                          duration: Duration(milliseconds: 300),
                          builder: (context, double value, child) =>
                              Opacity(opacity: value<=0.5?0:value,
                                child:  MText(text: widget.title,style: MarbleTypography.normalTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: widget.small?16.fSize:17.fSize
                                ),overflow: TextOverflow.fade,maxLines: 1,)),
                        ),
                        ),
                        Container(
                          height: widget.small?40:48,
                          width: widget.small?40:48,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(10000),
                            color: MarbleColors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_forward_ios, size: 13,),
                          ),
                        )
                      ],
                    ),   ),
                ),
              )
          ),
      onEnd: (){
        setState(() {
          animationHasEnded = true;
        });
      },
    );
  }
}
