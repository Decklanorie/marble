import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marble/src/features/map/widgets/fab.dart';
import 'package:marble/src/features/map/widgets/pin.dart';
import 'package:marble/src/shared/widgets/circular_avartar.dart';
import 'package:marble/src/shared/widgets/m_text.dart';
import '../../../core/utils/size_utils.dart';
import '../../../res/assets/app_assets.dart';
import '../../../res/colors.dart';
import '../../../res/topography/textstyles.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool showPrice = false;
  bool showOption = false;

  @override
  Widget build(BuildContext context) {
    double h = fheight(context);
    double w = fwidth(context);
    return Stack(
      children: [
        Container(
          height: fheight(context),
          width: fwidth(context),
          decoration: BoxDecoration(
              color: MarbleColors.black2,
            image: DecorationImage(
              image: AssetImage(MarbleAssets.blackMap),
              fit: BoxFit.cover
            )
          ),
        ),
        SafeArea(child: Scaffold(
          backgroundColor: MarbleColors.transparent,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45, // Replace 45.v with a fixed value or implement a scaling function
                  width: fwidth(context) * .68,
                  child: Center(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: Duration(milliseconds: 800),
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          alignment: Alignment.center, // Align to center
                          child: Container(
                            height: 45, // Replace 45.v with a fixed value or implement a scaling function
                            width: fwidth(context) * .68,
                            decoration: BoxDecoration(
                              color: MarbleColors.white,
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            alignment: Alignment.center,
                            child: TextField(
                              controller: TextEditingController(text: 'Saint Petersburg'),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Container(
                                  height: 34,
                                  width: 23,
                                  child: Center(
                                    child: Container(
                                      height: 25,
                                      width: 23,
                                      alignment: Alignment.center,
                                      child: SvgPicture.asset(
                                        MarbleAssets.searchIcon,
                                        color: MarbleColors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              style: MarbleTypography.titleTextStyle2.copyWith(
                                color: MarbleColors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                addHorizontalSpace(10),

                Container(
                  height: 45.v,
                  width: 45.v,
                  child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: Duration(milliseconds: 600),
                      builder: (context, scale, child) {
                        return Transform.scale(
                            scale: scale,
                            alignment: Alignment.bottomLeft,
                            child:CircularAvatar(
                                color: MarbleColors.white,
                                size: 45.v,
                                child: Center(
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    child: SvgPicture.asset(MarbleAssets.filter),
                                  ),
                                )
                            ));}),
                )

              ],
            ),
            preferredSize: Size(fwidth(context), 56),
          ),
        )),

        Positioned(
            bottom: h*.73,
            left: w*.3,
            child: Pin(title: '6,8mn',showPrice:showPrice)),
        Positioned(
            bottom: (h*.73)-60,
            left: w*.35,
            child: Pin(title: '45,8mn',showPrice:showPrice)),
        Positioned(
            bottom: (h*.73)-80,
            left: w*.7,
            child: Pin(title: '109,8mn',showPrice:showPrice)),
        Positioned(
            bottom: (h*.45),
            left: w*.7,
            child: Pin(title: '8mn',showPrice:showPrice)),
        Positioned(
            bottom: (h*.35),
            left: w*.6,
            child: Pin(title: '11,8mn',showPrice:showPrice)),
        Positioned(
            bottom: h*.4,
            left: w*.2,
            child: Pin(title: '7,8mn',showPrice:showPrice)),



        Positioned(
            bottom: (55+(h*.03))+(h*.03)+55,
            left: w*.08,
            child: FAB(icon: MarbleAssets.layer,canTap: true,onTap: (){
              setState(() {
                showOption=true;
              });
            },)),
        Positioned(
            bottom: (55+(h*.03))+(h*.03),
            left: w*.08,
            child: FAB(icon: MarbleAssets.direction2,canTap: false,)),
        Positioned(
            bottom: (55+(h*.03))+(h*.03),
            right: w*.08,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1.0),
              duration: Duration(milliseconds: 800),
              builder: (context, double value, child) =>
                  Transform.scale(
                      scale: value,
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 50, // Set the desired height
                        child: FittedBox(
                            child:FloatingActionButton.extended(
                              onPressed: (){}, label: MText(text: 'List of variants',style: MarbleTypography.normalTextStyle.copyWith(
                                color: MarbleColors.white.withOpacity(.8),fontSize: 17.fSize
                            ),),
                              backgroundColor: MarbleColors.deemGrey,
                              icon: Container(
                                width: 18,
                                child: SvgPicture.asset(MarbleAssets.align,color: MarbleColors.white,),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1000), // Full rounded border radius
                              ),
                            )
                        ),
                      )
                  ),
            )
        ),


        if(showOption)Positioned(
            bottom: (55+(h*.03))+(h*.03)+55,
            left: w*.08,
            child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 600),
                builder: (context, double value, child) =>
                    Transform.scale(
                        scale: value,
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          height: 160,
                          width: 170,
                          decoration: BoxDecoration(
                            color: MarbleColors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 37,
                                  width: 170,
                                  child: FittedBox(
                                      child:FloatingActionButton.extended(
                                        elevation:0,
                                        onPressed: (){
                                          setState(() {
                                            showPrice = false;
                                            showOption = false;
                                          });
                                          }, label:  Container(
                                          width: 170,
                                          child: MText(text: 'Cosy areas',style: MarbleTypography.normalTextStyle.copyWith(
                                              color: MarbleColors.lessDeemGrey,fontSize: 20.fSize
                                          ),)),
                                        backgroundColor: MarbleColors.white,
                                        icon: Container(
                                          width: 25,
                                          child: SvgPicture.asset(MarbleAssets.shield,color: MarbleColors.lessDeemGrey,width: 25,height: 25),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(1000), // Full rounded border radius
                                        ),
                                      )
                                  ),
                                ),
                                Container(
                                  height: 37,
                                  width: 170,
                                  child: FittedBox(
                                      child:FloatingActionButton.extended(
                                        elevation:0,
                                        onPressed: (){
                                          setState(() {
                                            showPrice = false;
                                            showOption = false;
                                          });
                                        }, label:  Container(
                                          width: 170,
                                          child: MText(text: 'Price',style: MarbleTypography.normalTextStyle.copyWith(
                                              color:!showPrice?MarbleColors.orange: MarbleColors.lessDeemGrey,fontSize:  20.fSize
                                          ),)),
                                        backgroundColor: MarbleColors.white,
                                        icon: Container(
                                          width: 28,
                                          child: SvgPicture.asset(MarbleAssets.wallet,color: !showPrice?MarbleColors.orange:MarbleColors.lessDeemGrey,width: 28,height: 28),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(1000), // Full rounded border radius
                                        ),
                                      )
                                  ),
                                ),
                                Container(
                                  height: 37,
                                  width: 170,
                                  child: FittedBox(
                                      child:FloatingActionButton.extended(
                                        elevation:0,
                                        onPressed: (){
                                          setState(() {
                                            showPrice = false;
                                            showOption = false;
                                          });
                                        }, label:  Container(
                                          width: 170,
                                          child: MText(text: 'Infrastructure',style: MarbleTypography.normalTextStyle.copyWith(
                                              color: MarbleColors.lessDeemGrey,fontSize:  20.fSize
                                          ),)),
                                        backgroundColor: MarbleColors.white,
                                        icon: Container(
                                          width: 24,
                                          child: SvgPicture.asset(MarbleAssets.bin,color: MarbleColors.lessDeemGrey,width: 24,height: 24),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(1000), // Full rounded border radius
                                        ),
                                      )
                                  ),
                                ),
                                Container(
                                  height: 37,
                                  width: 170,
                                  child: FittedBox(
                                      child:FloatingActionButton.extended(
                                        elevation:0,
                                        onPressed: (){
                                          setState(() {
                                            showPrice = true;
                                            showOption = false;
                                          });
                                        }, label:  Container(
                                          width: 170,
                                          child: MText(text: 'Without any layer',style: MarbleTypography.normalTextStyle.copyWith(
                                              color: !showPrice?MarbleColors.lessDeemGrey:MarbleColors.orange,fontSize:  20.fSize
                                          ),)),
                                        backgroundColor: MarbleColors.white,
                                        icon: Container(
                                          width: 26,
                                          child: SvgPicture.asset(MarbleAssets.layer,color: !showPrice? MarbleColors.lessDeemGrey:MarbleColors.orange,width: 26,height: 26),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(1000), // Full rounded border radius
                                        ),
                                      )
                                  ),
                                ),
                              ],
                          ),
                        )
                    )
            ),),


      ],
    );
  }
}
