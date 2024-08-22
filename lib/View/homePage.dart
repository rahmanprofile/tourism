import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tourism/Model/itemModel.dart';
import 'package:tourism/View/selectItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> category_list = [
    'Hotels',
    'Resturant',
    'Location',
    'Coffe',
  ];
  List<bool> category_bool = [
    true,
    false,
    false,
    false,
  ];

  List data = [];

  List<ItemModel> itemList = [];

  loadJson() async {
    String mydata = await rootBundle.loadString('assets/file.json');

    setState(() {
      data = json.decode(mydata);
      itemList = data.map((e) => ItemModel.fromJson(e)).toList();
      itemList = itemList;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await loadJson();
    });
    super.initState();
  }

  int page_index = 0;
  int curretntPage = 0;

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
        color: Color(0xffF2F2F2),
        height: myHeight,
        width: myWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: myWidth * 0.05, vertical: myHeight * 0.03),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      profile_image(),
                      SizedBox(
                        width: myWidth * 0.02,
                      ),
                      title_text(),
                    ],
                  ),
                  notification_icon()
                ],
              ),
              SizedBox(
                height: myHeight * 0.04,
              ),
              title(),
              SizedBox(
                height: myHeight * 0.03,
              ),
              Row(
                children: [
                  Expanded(flex: 5, child: search_box()),
                  SizedBox(
                    width: myWidth * 0.03,
                  ),
                  Expanded(flex: 1, child: filter_icon())
                ],
              ),
              SizedBox(
                height: myHeight * 0.03,
              ),
              category(),
              SizedBox(
                height: myHeight * 0.01,
              ),
              Expanded(child: show_items()),
              indicator()
            ],
          ),
        ));
  }

  Widget profile_image() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      height: myHeight * 0.05,
      width: myWidth * 0.1,
      decoration: BoxDecoration(
          color: Color(0xff514FFB).withOpacity(0.1),
          borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Image.asset(
          'assets/profile.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget title_text() {
    return RichText(
        text: TextSpan(
            text: 'Hello, ',
            style: DefaultTextStyle.of(context).style,
            children: const [
          TextSpan(
              text: 'Sergio!', style: TextStyle(fontWeight: FontWeight.bold))
        ]));
  }

  Widget notification_icon() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      height: myHeight * 0.06,
      width: myWidth * 0.1,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 5,
                color: Colors.grey.shade200,
                offset: Offset(3, 3))
          ]),
      child: Center(
        child: Image.asset(
          'assets/icon/5.1.png',
          height: myHeight * 0.02,
        ),
      ),
    );
  }

  Widget title() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Where would \nyou like to visit?',
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: myHeight * 0.05),
      ),
    );
  }

  Widget search_box() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: myWidth * 0.02),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 5,
                color: Colors.grey.shade200,
                offset: Offset(3, 3))
          ],
          borderRadius: BorderRadius.circular(13)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search Places',
            hintStyle: TextStyle(color: Colors.grey.shade400),
            icon: Image.asset(
              'assets/icon/6.1.png',
              color: Colors.grey.shade400,
              height: myHeight * 0.02,
            )),
      ),
    );
  }

  Widget filter_icon() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: myHeight * 0.018),
      decoration: BoxDecoration(
          color: Color(0xff514FFB),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 5,
                color: Colors.grey.shade200,
                offset: Offset(3, 3))
          ],
          borderRadius: BorderRadius.circular(13)),
      child: Image.asset(
        'assets/icon/7.1.png',
        height: myHeight * 0.02,
        color: Colors.white,
      ),
    );
  }

  Widget category_item(String txt, int index) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          right: myWidth * 0.07, top: myHeight * 0.01, bottom: myHeight * 0.01),
      child: GestureDetector(
        onTap: () {
          setState(() {
            category_bool = [
              false,
              false,
              false,
              false,
            ];
            category_bool[index] = true;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: category_bool[index] == true
                ? Color(0xff31313B)
                : Colors.grey.shade200,
          ),
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                  color: category_bool[index] == true
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget category() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      height: myHeight * 0.06,
      child: ListView.builder(
        itemCount: category_list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return category_item(category_list[index], index);
        },
      ),
    );
  }

  Widget item() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Center(
      child: itemList.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: myWidth * 0.0017),
              itemCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: myWidth * 0.02),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectItem(
                                    itemModel: itemList[index + page_index],
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(myHeight * 0.01),
                      width: myWidth * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 5,
                                color: Colors.grey.shade200,
                                offset: Offset(3, 3))
                          ]),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: myHeight * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            itemList[index + page_index].image),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: myHeight * 0.01,
                                    right: myWidth * 0.02),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: myWidth * 0.02,
                                        vertical: myHeight * 0.01),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      itemList[index + page_index].location,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: myHeight * 0.018),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: myHeight * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemList[index + page_index].name,
                                    style:
                                        TextStyle(fontSize: myHeight * 0.018),
                                  ),
                                  SizedBox(
                                    height: myHeight * 0.01,
                                  ),
                                  Text(
                                    itemList[index + page_index].price +
                                        '/night',
                                    style: TextStyle(
                                        fontSize: myHeight * 0.015,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/icon/3.1.png',
                                height: myHeight * 0.02,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget show_items() {
    return Container(
      child: PageView.builder(
        onPageChanged: (value) {
          if (value == 0) {
            setState(() {
              page_index = 0;
            });
          } else if (value == 1) {
            setState(() {
              page_index = 2;
            });
          } else if (value == 2) {
            setState(() {
              page_index = 4;
            });
          }
          setState(() {
            curretntPage = value;
          });
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return item();
        },
      ),
    );
  }

  Widget indicator() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3, (index) {
        return AnimatedContainer(
          duration: Duration(microseconds: 300),
          height: myHeight * 0.01,
          width: (index == curretntPage) ? myWidth * 0.04 : myWidth * 0.02,
          margin: EdgeInsets.symmetric(
              horizontal: myHeight * 0.005, vertical: myWidth * 0.02),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: index == curretntPage
                  ? Colors.grey
                  : Colors.grey.withOpacity(0.4)),
        );
      }),
    );
  }
}
