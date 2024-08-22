import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tourism/Model/itemModel.dart';

class SelectItem extends StatefulWidget {
  ItemModel? itemModel;

  SelectItem({this.itemModel});

  @override
  State<SelectItem> createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: myHeight,
          width: myWidth,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(myHeight * 0.03),
                child: Column(
                  children: [
                    item_info(),
                    facilities_row(),
                    show_facilities(),
                    description_score()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item_info() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      height: myHeight * 0.55,
      decoration: BoxDecoration(
          color: Colors.amber,
          image: DecorationImage(
              image: AssetImage(widget.itemModel!.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [back_icon(), description()],
      ),
    );
  }

  Widget back_icon() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: myWidth * 0.03, top: myHeight * 0.02),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: myHeight * 0.06,
          width: myWidth * 0.1,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 7,
                    spreadRadius: 1,
                    color: Colors.grey.shade600,
                    offset: Offset(3, 3))
              ]),
          child: Center(
            child: Image.asset(
              'assets/icon/8.1.png',
              height: myHeight * 0.02,
            ),
          ),
        ),
      ),
    );
  }

  Widget description() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: myWidth * 0.03, vertical: myWidth * 0.03),
      child: buildBlur(
        child: Container(
          height: myHeight * 0.13,
          padding: EdgeInsets.symmetric(
              horizontal: myWidth * 0.03, vertical: myHeight * 0.02),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.itemModel!.name,
                      style: TextStyle(
                          fontSize: myHeight * 0.03, color: Colors.white),
                    ),
                    RichText(
                        text: TextSpan(
                            text: widget.itemModel!.price,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: myHeight * 0.03),
                            children: [
                          TextSpan(
                              text: '/night',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: myHeight * 0.02))
                        ]))
                  ],
                ),
                SizedBox(
                  height: myHeight * 0.02,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/icon/9.1.png',
                      height: myHeight * 0.02,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: myWidth * 0.02,
                    ),
                    Text(
                      widget.itemModel!.location,
                      style: TextStyle(
                          fontSize: myHeight * 0.018, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBlur({
    required Widget child,
    double sigmaX = 1,
    double sigmaY = 1,
  }) =>
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: child,
        ),
      );

  Widget facilities_row() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: myHeight * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Facilities',
            style: TextStyle(fontSize: myHeight * 0.023),
          ),
          Row(
            children: [
              Text(
                'See all',
                style:
                    TextStyle(fontSize: myHeight * 0.018, color: Colors.grey),
              ),
              SizedBox(
                width: myWidth * 0.01,
              ),
              Image.asset(
                'assets/icon/10.1.png',
                height: myHeight * 0.01,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget show_facilities() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: myHeight * 0.02),
      child: Container(
        height: myHeight * 0.14,
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return facilities_item(index);
          },
        ),
      ),
    );
  }

  Widget facilities_item(int index) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: myWidth * 0.05),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.06, vertical: myHeight * 0.025),
              child: Center(
                child: Image.asset(
                  widget.itemModel!.facilities[index].icon,
                  height: myHeight * 0.03,
                  color: Color(0xff514FFB),
                ),
              ),
            ),
          ),
          SizedBox(
            height: myHeight * 0.015,
          ),
          Text(
            widget.itemModel!.facilities[index].name,
            style: TextStyle(color: Colors.grey, fontSize: myHeight * 0.015),
          )
        ],
      ),
    );
  }

  Widget description_score() {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Property Description',
              style: TextStyle(fontSize: myHeight * 0.023),
            )
          ],
        ),
        SizedBox(
          height: myHeight * 0.02,
        ),
        Row(
          children: [
            Image.asset(
              'assets/icon/11.1.png',
              height: myHeight * 0.015,
              color: Colors.amber,
            ),
            SizedBox(
              width: myWidth * 0.02,
            ),
            Text(
              widget.itemModel!.score + '(12.647 Reviews)',
              style: TextStyle(fontSize: myHeight * 0.015, color: Colors.grey),
            )
          ],
        ),
        SizedBox(
          height: myHeight * 0.02,
        ),
        Text(
          widget.itemModel!.description,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: myHeight * 0.015, color: Colors.grey),
        )
      ],
    );
  }
}
