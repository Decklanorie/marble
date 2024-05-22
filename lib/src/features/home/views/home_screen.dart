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

import '../controller/count_format.dart';
import '../widgets/gallery_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Tween<double> animation;
  late Tween<double> animation2;
  late Tween<double> animation3;
  late Tween<double> animation4;
  bool _isInitialAnimationDone = false;
  bool showBS = false;
  bool step2 = false;
  bool step3 = false;
  late Timer timer1;
  late Timer timer2;
  late Timer timer3;
  late Timer timer4;

  @override
  void initState() {
    animation = Tween<double>(begin: 0, end: 1034);
    animation.animate(AnimationController(duration: Duration(seconds: 1), vsync: this));
    animation2 = Tween<double>(begin: 0, end: 2212);
    animation2.animate(AnimationController(duration: Duration(seconds: 1), vsync: this));

    animation4 = Tween<double>(begin: 0, end: 1.0);
    animation4.animate(AnimationController(duration: Duration(milliseconds: 800), vsync: this));

    timer1 = Timer(Duration(milliseconds: 800), () {
      setState(() {
        step2 = true;
      });
    });
    timer2 = Timer(Duration(milliseconds: 1600), () {
      setState(() {
        step3 = true;
      });
    });
    timer3 = Timer(Duration(milliseconds:  2000), () {
      if (Platform.isAndroid && mounted) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: MarbleColors.transparent,
          systemNavigationBarColor: MarbleColors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ));
      }
    });
    timer4 = Timer(Duration(milliseconds:  1800), () {
      setState(() {
        showBS = true;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 300), () {
        setState(() {
          _isInitialAnimationDone = true;
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    try{
      timer3.cancel();
      timer1.cancel();
      timer2.cancel();
      timer4.cancel();
    }catch(e){}
    super.dispose();
  }
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
        child:SafeArea(
            child: Stack(children:[
              Scaffold(
                  backgroundColor: MarbleColors.transparent,
                  extendBodyBehindAppBar: true,
                  appBar: PreferredSize(
                    child:  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TweenAnimationBuilder(
                            tween: Tween<double>(begin: 0.0, end: 1.0),
                            duration: Duration(milliseconds: 800),
                            builder: (context, double value, child) => Align(
                              alignment: Alignment.centerLeft,
                              child: Transform.scale(
                                scaleX: value,
                                alignment: Alignment.centerLeft,
                                child: Opacity(
                                  opacity: value,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    alignment: Alignment.center,
                                    child:Text.rich(TextSpan(
                                        children: [
                                          WidgetSpan(child: SvgPicture.asset(MarbleAssets.location, height: 17,)),
                                          WidgetSpan(child: testSpace),
                                          TextSpan(text: 'Saint Petersburg', style: MarbleTypography.titleTextStyle.copyWith(color: MarbleColors.grey))
                                        ]
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ),



                          Container(
                              height: 40,
                              width: 40,
                              child:Center(
                                child: TweenAnimationBuilder(
                                    tween: animation4,
                                    duration: Duration(milliseconds: 800),
                                    builder: (context, double value, child) =>
                                        Transform.scale(
                                          scale: value,
                                          child: CircularAvatar(
                                            size: 40,
                                            image: MarbleAssets.profilePicture2,
                                          ),
                                        )
                                ),
                              )),

                        ],
                      ),
                    ),
                    preferredSize: Size(fwidth(context), 50),
                  ),
                  body: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        addVerticalSpace(90),
                        if(step2)TweenAnimationBuilder(
                          tween: animation4,
                          duration: Duration(milliseconds: 800),
                          builder: (context, double value, child) =>
                              Opacity(opacity: value<=0.5?0:value,
                                child:  MText(
                                    text: 'Hi, Marina',
                                    style: MarbleTypography.introTextStyle),),
                        ),

                        addVerticalSpace(5),
                        if(step2)Container(
                            height: 35,
                            child:ClipRect(
                              child: TweenAnimationBuilder(
                                tween: Tween<Offset>(begin: Offset(0, 35), end: Offset(0, 0)),
                                duration: Duration(milliseconds: 800),
                                builder: (context, Offset offset, child) {
                                  return Transform.translate(
                                    offset: offset,
                                    child: TweenAnimationBuilder(
                                      tween: Tween<double>(begin: 1.0, end: 1.0),
                                      duration: Duration(milliseconds: 800),
                                      builder: (context, double opacity, child) {
                                        return Opacity(
                                          opacity: opacity,
                                          child: child,
                                        );
                                      },
                                      child: MText(
                                        text: "Let's select your",
                                        style: MarbleTypography.bigIntroTextStyle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                        ),
                        if(step2)Container(
                            height: 35,
                            child:ClipRect(
                              child: TweenAnimationBuilder(
                                tween: Tween<Offset>(begin: Offset(0, 35), end: Offset(0, 0)),
                                duration: Duration(milliseconds: 800),
                                builder: (context, Offset offset, child) {
                                  return Transform.translate(
                                    offset: offset,
                                    child: TweenAnimationBuilder(
                                      tween: Tween<double>(begin: 1.0, end: 1.0),
                                      duration: Duration(milliseconds: 800),
                                      builder: (context, double opacity, child) {
                                        return Opacity(
                                          opacity: opacity,
                                          child: child,
                                        );
                                      },
                                      child: MText(
                                        text: "perfect place",
                                        style: MarbleTypography.bigIntroTextStyle,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                        ),

                        addVerticalSpace(35),

                        if(step3)Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TweenAnimationBuilder(
                              tween: animation,
                              duration: Duration(seconds: 1),
                              builder: (context, double value, child) =>
                                  Container(
                                      height: 175.h,
                                      width: 175.h,
                                      child:Center(
                                        child: TweenAnimationBuilder(
                                            tween: animation4,
                                            duration: Duration(milliseconds: 800),
                                            builder: (context, double value3, child) =>
                                                Transform.scale(
                                                  scale: value3,
                                                  child: CircularAvatar(
                                                    size: 175.h,
                                                    color:MarbleColors.orange,
                                                    padding:EdgeInsets.all(20),
                                                    child: Column(
                                                      children: [
                                                        MText(
                                                          text: 'BUY',style: MarbleTypography.normalTextStyle.copyWith(color: MarbleColors.white),
                                                        ),
                                                        addVerticalSpace(25),
                                                        MText(
                                                          text: countFormat(value.toInt().toString()),style: MarbleTypography.normalTextStyle.copyWith(
                                                            color: MarbleColors.white,
                                                            fontSize: 38.fSize,
                                                            fontWeight: FontWeight.w800),
                                                        ),
                                                        MText(
                                                          text: 'offers',style: MarbleTypography.normalTextStyle.copyWith(color: MarbleColors.white),
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                )
                                        ),
                                      )),
                            ),
                            addHorizontalSpace(6),

                            TweenAnimationBuilder(
                              tween: animation2,
                              duration: Duration(seconds: 1),
                              builder: (context, double value, child) =>
                                  Container(
                                      height: 175.h,
                                      width: 175.h,
                                      child:Center(
                                        child: TweenAnimationBuilder(
                                            tween: animation4,
                                            duration: Duration(milliseconds: 800),
                                            builder: (context, double value3, child) =>
                                                Transform.scale(
                                                    scale: value3,
                                                    child: Container(
                                                      height: 175.h,
                                                      width: 175.h,
                                                      decoration: BoxDecoration(
                                                          color:MarbleColors.white,
                                                          borderRadius: BorderRadius.circular(15)
                                                      ),
                                                      padding:EdgeInsets.all(20),
                                                      child: Column(
                                                        children: [
                                                          MText(
                                                            text: 'RENT',style: MarbleTypography.normalTextStyle.copyWith(color: MarbleColors.grey),
                                                          ),
                                                          addVerticalSpace(25),
                                                          MText(
                                                            text: countFormat(value.toInt().toString()),style: MarbleTypography.normalTextStyle.copyWith(
                                                              color: MarbleColors.grey,
                                                              fontSize: 38.fSize,
                                                              fontWeight: FontWeight.w800),
                                                          ),
                                                          MText(
                                                            text: 'offers',style: MarbleTypography.normalTextStyle.copyWith(color: MarbleColors.grey),
                                                          ),

                                                        ],
                                                      ),
                                                    )
                                                )
                                        ),
                                      )),
                            ),
                          ],
                        ),


                      ],
                    ),)
              ),



              if(showBS) OrientationBuilder(
        builder: (context, orientation) {
      if(orientation == Orientation.portrait){
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: _isInitialAnimationDone ? (fheight(context)-440.h)/fheight(context) : 0.0),
          duration: Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return DraggableScrollableSheet(
              initialChildSize: value,
              minChildSize: value,
              maxChildSize:(fheight(context)*.75)>650?(.7):((fheight(context)*.85)/(fheight(context))),
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35),)
                    ),
                    child: GalleryBottomSheet(scrollController:scrollController)
                );
              },
            );
          },
        );
      }else{
       return SizedBox.shrink();
      }
        })
            ])
        )
    );
  }



}
