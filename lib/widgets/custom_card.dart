import 'package:flutter/material.dart';
import 'package:radio_on_app/widgets/custom_text.dart';
import 'package:radio_on_app/screens/training_screen.dart';
import 'package:radio_on_app/screens/videos.dart';

class CustomCard extends StatelessWidget {
  double mPaddingCard = 10.0;
  double mCustomWidth = 300;
  double mCustomHeight = 200;
  double mVerticalTopPadding = 10.0;
  double mVerticalTopTitlePadding = 10.0;
  double mCustomMargin = 10.0;
  double mBorderRadius = 15.0;

  int mId;
  String mTitle;
  String mPathImage;
  Icon mIcon;
  Color mFilter = Colors.yellow;
  double mOpacity = 0.3;
  double mTitleSize = 32.0;
  BuildContext mContext;

  CustomCard(this.mId, this.mTitle, this.mPathImage,this.mIcon){
    this.mVerticalTopTitlePadding = 120.0;
  }

  CustomCard.vertical(this.mId, this.mTitle, this.mPathImage,this.mIcon, this.mFilter){
    this.mOpacity = 0.1;
    this.mCustomWidth = 170.0;
    this.mCustomHeight = 230.0;
    this.mVerticalTopPadding = 180.0;
    this.mTitleSize = 22.0;
    this.mVerticalTopTitlePadding = 177.0;
  }

  CustomCard.hero(this.mId, this.mTitle, this.mPathImage,this.mIcon, this.mFilter, this.mContext){
    this.mOpacity = 0.1;
    this.mCustomWidth = null;
    this.mCustomHeight = null;
    this.mVerticalTopPadding = 110.0;
    this.mTitleSize = 28.0;
    this.mVerticalTopTitlePadding = 30.0;
    this.mCustomMargin = 0.0;
    this.mBorderRadius = 0.0;
    this.mPaddingCard = 35.0;

  }

  @override
  Widget build(BuildContext context) {

    final mContainer = Container(
      decoration: BoxDecoration(
          color: mFilter,
          borderRadius: BorderRadius.circular(mBorderRadius),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(mFilter.withOpacity(mOpacity), BlendMode.dstATop),
              image: AssetImage(mPathImage),
              fit: BoxFit.cover
          )
      ),
    );

    final mIndicators = Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
          color: Colors.white,
        ),
        CustomText.margin("15'", Colors.white, 16.0, 5.0, 15.0, 0.0, 0.0),
        Icon(
          Icons.timelapse,
          color: Colors.white,
        ),
        CustomText.margin("6", Colors.white, 16.0, 5.0, 15.0, 0.0, 0.0)
      ],
    );

    final mFab = FloatingActionButton(
      mini: true,
      heroTag: "mFab_$mId",
      onPressed: null,
      backgroundColor: Colors.black26,
      child: mIcon,
    );

    return GestureDetector(
      onTap: (){
        if(mId > 0){
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return videos();
            //return TrainingScreen(2, "Galeria de videos", "assets/youtube.jpg",Icon(Icons.video_library), Color(0xFFD50000) );
          }));
        }
      },
      child: Container(
          width: mCustomWidth,
          height: mCustomHeight,
          margin: EdgeInsets.only(left: mCustomMargin, right: mCustomMargin),
          child: Hero(
            tag: "mHero_$mId",
            child: Stack(
              children: <Widget>[
                mContainer,
                Positioned(
                  top: mVerticalTopTitlePadding + (mPaddingCard*3),
                  left: mPaddingCard,
                  child: CustomText(mTitle, Colors.white, mTitleSize),
                ),
                Positioned(
                  top: mVerticalTopPadding,
                  left: mPaddingCard,
                  child: mIndicators,
                ),
                Positioned(
                  right: mPaddingCard,
                  top: mPaddingCard,
                  child: mFab,
                )
              ],
            ),
          )
      ),
    );
  }
}
