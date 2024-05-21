import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble/src/core/utils/size_utils.dart';
import 'package:marble/src/res/assets/app_assets.dart';
import 'package:marble/src/res/colors.dart';

import '../shared/bottom_navigation.dart';
import '../shared/widgets/bottom_nav_item.dart';

class ScaffoldWithNavbar extends StatefulWidget {
   ScaffoldWithNavbar(this.navigationShell, {super.key});
  int index = 2;
   StatefulNavigationShell navigationShell;

   @override
   State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> with TickerProviderStateMixin {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MarbleColors.deemWhite,
      body: Stack(
          children:[
            widget.navigationShell,
            Positioned(
              bottom: 30,
              child: Container(
                width: fwidth(context),
                child: Center(
                  child: Container(
                    height: 55,
                    width: 260,
                    decoration: BoxDecoration(
                      color: MarbleColors.black,
                      borderRadius: BorderRadius.circular(10000),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BottomNavItem(index:1,isActive: index==1, onTap:(){
                          widget.navigationShell.goBranch(
                            1,
                            initialLocation: 1 == widget.navigationShell.currentIndex,
                          );
                        }, icon:MarbleAssets.search, reverseTap:(){
                          setState(() {
                            index=1;
                          });
                        }),
                        BottomNavItem(index:2,isActive: false, onTap:(){}, icon:MarbleAssets.message),
                        BottomNavItem(index:0,isActive: index==0, onTap:(){
                          widget.navigationShell.goBranch(
                            0,
                            initialLocation: 0 == widget.navigationShell.currentIndex,
                          );
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
              )
            )
          ]),
      // bottomNavigationBar: MarbleBottomNavigation(navigationShell: navigationShell,),
    );
  }

}