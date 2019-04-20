import 'package:flutter/material.dart';
import 'package:radio_on_app/widgets/custom_card.dart';
import 'package:radio_on_app/widgets/custom_text.dart';
import 'package:flutube/flutube.dart';

class TrainingScreen extends StatelessWidget {
  final List<String> playlist = <String>[
    'https://www.youtube.com/watch?v=7hFQC3nmm2c&t=0s',
    'https://www.youtube.com/watch?v=D-o4BqJxmJE',
  ];
  int currentPos;
  String stateText;



  Color mPurpleColor = Color(0xFF6200ea);
  String mTitle;
  String mPathImage;
  Icon mIcon;
  Color mColor;
  int mId;

  TrainingScreen(this.mId, this.mTitle, this.mPathImage, this.mIcon, this.mColor);
  //TrainingScreen();
  @override
  Widget build(BuildContext context) {

    final videoYoutube = Container(
      height: 240.0,
      margin: EdgeInsets.only(bottom: 20.0),

      child: ListView(
        children: <Widget>[
          HandpickedCard("Find and Select", "Skeleton"),
          HandpickedCard("asdsadsadsad", "Muscles"),
          HandpickedCard("sdfsdfdsf", "Nervous System"),
          HandpickedCard("sdsss", "Respiratory System")
        ],
      ),
    );


    final ListHandPicked = Container(
      height: 400.0,
      margin: EdgeInsets.only(top:100.0, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white
      ),
      child: ListView(
        children: <Widget>[
          // CustomText.margin("April 6th", Colors.grey, 18.0, 20.0, 0.0, 20.0, 10.0),
          // CustomText.margin("Ready to Learn?", Colors.amberAccent, 24.0, 20.0, 0.0, 0.0, 30.0),
          //CustomCard(1, "Radio Topo", "assets/banner.png",Icon(Icons.account_balance_wallet), ),
          //CustomText.margin("Handpicked", Colors.black, 20.0, 20.0, 0.0, 20.0, 30.0),
          videoYoutube
        ],
      ),
      /*child: ListView(
        children: <Widget>[
          HandpickedCard("Find and Select", "Skeleton"),
          HandpickedCard("Scan for Musclest", "Muscles"),
          HandpickedCard("Growing", "Nervous System"),
          HandpickedCard("Matching", "Respiratory System")
        ],
      ),*/
    );

    final HeadBar = Container(
      height: 40.0,
      width: 200.0,
      child: Row(
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: SizedBox(
                height: 30.0,
                width: 30.0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 30.0, color: Colors.white),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                )
            ),
          ),
          CustomText.margin("VIDEOS", Colors.white, 22.0, 15.0, 0.0,15.0,0.0),
        ],
      ),
    );

    return MaterialApp(
      home: Scaffold(
          body: Hero(
              tag: "mHero_$mId",
              child: Stack(
                children: <Widget>[
                  CustomCard.hero(0, mTitle, mPathImage, mIcon, mColor, context),
                  Center(
                    child: ListHandPicked,
                  ),
                  Positioned(
                    top: 30.0,
                    left: 20.0,
                    child: HeadBar,
                  )
                ],
              )

          )
      ),
    );
  }
}

class HandpickedCard extends StatelessWidget {
  Color mPurpleColor = Color(0xFF6200ea);

  String mTitle;
  String mTSubttle;

  HandpickedCard(this.mTitle, this.mTSubttle);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15.0)
            ),
            child: Icon(
              Icons.blur_circular,
              color: mPurpleColor,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText.margin(mTitle, mPurpleColor, 18.0, 10.0, 0.0, 10.0, 5.0),
                CustomText.margin(mTSubttle, Colors.black38, 14.0, 10.0, 0.0,0.0,0.0),
              ],
            ),
          ),
          Icon(
            Icons.scanner,
            color: mPurpleColor,
          )
        ],
      ),
    );
  }
}
