import 'package:get/get.dart';
import 'package:flutter_testing_1/models/football_models.dart';

class FootballController extends GetxController{
    var players = <Player>[
    Player(
      profileImage: 'https://latest.fotmob.com/wp-content/uploads/2025/02/Covers_Dembele-article-0702-1.png',
      name: 'Ousmane Dembélé',
      position: 'Forward',
      number: 10,
    ),
    Player(
      profileImage: 'https://library.sportingnews.com/styles/twitter_card_120x120/s3/2022-12/Kylian%20Mbappe%20France%2012062022.jpg?itok=ctgIxoBP',
      name: 'Kylian Mbappe',
      position: 'Forward',
      number: 10,
    ),
    Player(
      profileImage: 'https://is3.cloudhost.id/jakarta/images/image-article/2025-08/07/-foto-6893dfe59565b.webp',
      name: 'Andre Onana',
      position: 'Keeper',
      number: 24,
    ),
    Player(
      profileImage: 'https://sm.mashable.com/mashable_id/photo/default/result-well-keep-fighting-thank-you-rbl-fans-for-your-uncond_s1ps.jpg',
      name: 'Benjamin Šeško',
      position: 'Forward',
      number: 30,
    ),
    Player(
      profileImage: 'https://i2-prod.football.london/incoming/article30069161.ece/ALTERNATES/s1200c/0_GettyImages-2176514384.jpg',
      name: 'Harry Maguire',
      position: 'Back',
      number: 5,
    ),
  ].obs;


  void updatePlayer(int index, Player newPlayer) {
    players[index] = newPlayer; 
  }
}