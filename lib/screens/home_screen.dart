import 'package:flutter/material.dart';
import 'package:radio_on_app/widgets/custom_text.dart';
import 'package:radio_on_app/widgets/custom_card.dart';
import 'package:radio_on_app/screens/radio.dart';

class HomeScreen extends StatelessWidget {
  Color mPurpleColor = Color(0xFA4341c);

  @override
  Widget build(BuildContext context) {
    //MyApp();
    final mVerticalList = Container(
      height: 240.0,
      margin: EdgeInsets.only(bottom: 10.0),

      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CustomCard.vertical(2, "Galeria de videos", "assets/youtube.jpg",Icon(Icons.video_library), Color(0xFFD50000) ),
          CustomCard.vertical(3, "Ranking de la semana", "assets/ranking.jpg",Icon(Icons.music_note), Color(0xFF0091ea) ),
          CustomCard.vertical(4, "Nuestros servicios", "assets/youtube.jpg",Icon(Icons.room_service),Color(0xFF00B8D4)),
        ],
      ),
    );

    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
         // CustomText.margin("April 6th", Colors.grey, 18.0, 20.0, 0.0, 20.0, 10.0),
         // CustomText.margin("Ready to Learn?", Colors.amberAccent, 24.0, 20.0, 0.0, 0.0, 30.0),
          CustomCard(1, "Radio Topo", "assets/banner.png",Icon(Icons.account_balance_wallet), ),
          CustomText.margin("Handpicked", Colors.black, 20.0, 20.0, 0.0, 20.0, 30.0),
          mVerticalList
        ],
      ),
    );


  }
}
