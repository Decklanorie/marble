
import 'package:flutter/cupertino.dart';
import 'package:marble/src/core/utils/size_utils.dart';
import 'package:marble/src/features/home/widgets/animated_slider.dart';
import 'package:marble/src/res/assets/app_assets.dart';
import 'package:marble/src/res/colors.dart';

class GalleryBottomSheet extends StatefulWidget {
   GalleryBottomSheet({required this.scrollController});
   ScrollController scrollController;
@override
State<GalleryBottomSheet> createState() => _GalleryBottomSheetState();
}

class _GalleryBottomSheetState extends State<GalleryBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: widget.scrollController,
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: fwidth(context),
            height:fwidth(context)*.527,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: AssetImage(MarbleAssets.place1),
                  fit: BoxFit.cover
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedSliderButton(title: 'Gladkova St., 25', width: fwidth(context),small: false,)
              ],
            ),
          ),
          addVerticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: fwidth(context)*.5 - 15,
                height:(fwidth(context)*.5 - 15)*1.75,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: AssetImage(MarbleAssets.place2),
                        fit: BoxFit.cover
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AnimatedSliderButton(title: 'Gladkova St., 25', width: fwidth(context),small: true,)
                  ],
                ),
              ),
              Container(
                width: fwidth(context)*.5 - 15,
                height:(fwidth(context)*.5 - 15)*1.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: fwidth(context)*.5 - 15,
                      height:(fwidth(context)*.5 - 15)*0.87-5,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: AssetImage(MarbleAssets.place3),
                              fit: BoxFit.cover
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedSliderButton(title: 'Gladkova St., 25', width: fwidth(context),small: true)
                        ],
                      ),
                    ),
                    Container(
                      width: fwidth(context)*.5 - 15,
                      height:(fwidth(context)*.5 - 15)*0.87-5,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                            image: AssetImage(MarbleAssets.place4),
                            fit: BoxFit.cover
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedSliderButton(title: 'Gladkova St., 25', width: fwidth(context),small: true)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ] ,
      );
  }
}

