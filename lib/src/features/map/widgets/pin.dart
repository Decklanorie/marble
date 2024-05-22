import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marble/src/res/assets/app_assets.dart';
import 'package:marble/src/res/topography/textstyles.dart';
import 'package:marble/src/shared/widgets/m_text.dart';

import '../../../core/utils/size_utils.dart';
import '../../../res/colors.dart';

class Pin extends StatefulWidget {
  Pin({super.key, required this.title, required this.showPrice});
  String title;
  bool showPrice;
  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  bool show = false;
  late Timer timer1;

  @override
  void initState() {
    timer1 = Timer(Duration(milliseconds: 900), () {
      setState(() {
        show = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    try {
      timer1.cancel();
    }catch(e){}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = fheight(context);
    double w = fwidth(context);
    return show?TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
    duration: Duration(milliseconds: 600),
    builder: (context, scale, child) {
    return Transform.scale(
    scale: scale,
    alignment: Alignment.bottomLeft,
    child:Row(
      mainAxisSize: MainAxisSize.min, // Ensures the row is as small as its content
      children: [
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: Container(
              height: 47,
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: MarbleColors.orange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: widget.showPrice?Container(
                  width: 19,
                  child: SvgPicture.asset(MarbleAssets.hotel4,color: MarbleColors.white,),
                ): MText(
                  text: widget.title,
                  style: MarbleTypography.normalTextStyle.copyWith(
                    color: MarbleColors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
        }):SizedBox.shrink();
  }
}
