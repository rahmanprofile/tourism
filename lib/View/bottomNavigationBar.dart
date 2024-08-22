import 'package:flutter/material.dart';
import 'package:tourism/View/homePage.dart';
import 'package:tourism/View/savePage.dart';
import 'package:tourism/View/settingPage.dart';
import 'package:tourism/View/ticketPage.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int current_index = 0;
  static List<Widget> pages = [
    HomePage(),
    TicketPage(),
    SavePage(),
    SettingPage()
  ];

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: pages[current_index],
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              left: myWidth * 0.04,
              right: myWidth * 0.04,
              bottom: myHeight * 0.02),
          child: Container(
            height: myHeight * 0.1,
            decoration: BoxDecoration(
                color: Color(0xff31313B),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        current_index = 0;
                      });
                    },
                    icon: current_index == 0
                        ? Image.asset(
                            'assets/icon/1.2.png',
                            height: myHeight * 0.02,
                            color: Colors.white,
                          )
                        : Image.asset(
                            'assets/icon/1.1.png',
                            height: myHeight * 0.02,
                            color: Colors.white,
                          )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        current_index = 1;
                      });
                    },
                    icon: current_index == 1
                        ? Image.asset(
                            'assets/icon/2.2.png',
                            height: myHeight * 0.02,
                            color: Colors.white,
                          )
                        : Image.asset(
                            'assets/icon/2.1.png',
                            height: myHeight * 0.02,
                            color: Colors.white,
                          )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        current_index = 2;
                      });
                    },
                    icon: current_index == 2
                        ? Image.asset(
                            'assets/icon/3.2.png',
                            height: myHeight * 0.02,
                            color: Colors.white,
                          )
                        : Image.asset(
                            'assets/icon/3.1.png',
                            height: myHeight * 0.02,
                            color: Colors.white,
                          )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        current_index = 3;
                      });
                    },
                    icon: current_index == 3
                        ? Image.asset(
                            'assets/icon/4.2.png',
                            height: myHeight * 0.02,
                            color: Colors.white,
                          )
                        : Image.asset(
                            'assets/icon/4.1.png',
                            height: myHeight * 0.02,
                            color: Colors.white,
                          )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
