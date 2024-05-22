import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble/src/core/utils/size_utils.dart';
import 'package:marble/src/res/assets/app_assets.dart';
import 'package:marble/src/res/colors.dart';

import '../shared/bottom_navigation.dart';
import '../shared/widgets/bottom_nav_item.dart';

class ScaffoldWithNavbar extends StatefulWidget {
   ScaffoldWithNavbar(this.navigationShell, {super.key});
   StatefulNavigationShell navigationShell;

   @override
   State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> with TickerProviderStateMixin {
  int index = 0;
  bool showBN = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MarbleColors.deemWhite,
      body: Stack(
          children:[
            widget.navigationShell,
           Positioned(
              bottom: 0,
              child: Container(
                width: fwidth(context),
                child: Container(
                    height: 55+(fheight(context)*.03),
                    width: 260,
                    child:ClipRect(
                      child: TweenAnimationBuilder(
                        curve: Curves.slowMiddle,
                        tween: Tween<Offset>(begin: Offset(0, 303), end: Offset(0, 0)),
                        duration: Duration(milliseconds: 3700),
                        builder: (context, Offset offset, child) {
                          return Transform.translate(
                            offset: offset,
                            child: Center(
                              child: Container(
                                height: 55,
                                width: 260,
                                margin: EdgeInsets.only(bottom: fheight(context)*.03),
                                decoration: BoxDecoration(
                                  color: MarbleColors.black,
                                  borderRadius: BorderRadius.circular(10000),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    BottomNavItem(index:1,isActive: index==1, onTap:(){
                                      context.pushReplacement('/map');
                                    }, icon:MarbleAssets.search, reverseTap:(){
                                      setState(() {
                                        index=1;
                                      });
                                    }),
                                    BottomNavItem(index:2,isActive: false, onTap:(){}, icon:MarbleAssets.message),
                                    BottomNavItem(index:0,isActive: index==0, onTap:(){
                                      context.pushReplacement('/home');
                                    }, icon:MarbleAssets.house,reverseTap:(){
                                      setState(() {
                                        index=0;
                                      });
                                    }),
                                    BottomNavItem(index:3,isActive: false, onTap:(){}, icon:MarbleAssets.likey),
                                    BottomNavItem(index:4,isActive: false, onTap:(){}, icon:MarbleAssets.person),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                ),
              )
            )
          ]),
      // bottomNavigationBar: MarbleBottomNavigation(navigationShell: navigationShell,),
    );
  }

}