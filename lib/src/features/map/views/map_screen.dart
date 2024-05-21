import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marble/src/shared/widgets/circular_avartar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: fheight(context),
          width: fwidth(context),
          color: MarbleColors.black2,
        ),
        SafeArea(child: Scaffold(
          backgroundColor: Colors.black,
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 47,
                    width: fwidth(context)*.68,
                    decoration: BoxDecoration(
                        color: MarbleColors.white,
                        borderRadius: BorderRadius.circular(1000)
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      controller: TextEditingController(text: 'Saint Petersburg'),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon:
                        Container(
                            height: 34,
                            width: 23,
                            child: Center(
                          child: Container(
                              height: 25,
                              width: 23,
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 23,
                                height: 23,
                                child: SvgPicture.asset(MarbleAssets.searchIcon,color: MarbleColors.black),
                              )
                          ),
                        ))
                      ),
                      style: MarbleTypography.titleTextStyle2.copyWith(
                          color: MarbleColors.black
                      ),
                    )
                ),

                addHorizontalSpace(10),

                CircularAvatar(
                  color: MarbleColors.white,
                  size: 47,
                  child: Center(
                    child: Container(
                      height: 20,
                      width: 20,
                      child: SvgPicture.asset(MarbleAssets.filter),
                    ),
                  )
                )

              ],
            ),
            preferredSize: Size(fwidth(context), 56),
          ),
        )),

      ],
    );
  }
}
