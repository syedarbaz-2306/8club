import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hotspot/core/my_logger.dart';
import 'package:hotspot/models/experience_model.dart';

class ApiService {
  final Dio dio = Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL'] ?? ""));
  static const useMockData = true;
  Future<List<ExperienceModel>> avaiableExp() async {
    if (useMockData) {
      final mockJson = [
        {
          "id": 23,
          "name": "Party",
          "tagline": "",
          "description": "Lights, music & non-stop fun.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/party+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Party.png",
          "order": 1
        },
        {
          "id": 21,
          "name": "House Party",
          "tagline": "",
          "description": "Home vibes, loud beats & snacks.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/house+party+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/House+Party.png",
          "order": 2
        },
        {
          "id": 1,
          "name": "Picnic",
          "tagline": "",
          "description": "Chill outdoors with food, friends & fun.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/picnic+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Picnic.png",
          "order": 3
        },
        {
          "id": 13,
          "name": "Brunch",
          "tagline": "",
          "description": "Late morning bites & mimosas.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/brunch+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Brunch.png",
          "order": 4
        },
        {
          "id": 22,
          "name": "Lunch",
          "tagline": "",
          "description": "Chill midday meal with good food.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/lunch+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Lunch.png",
          "order": 5
        },
        {
          "id": 20,
          "name": "Dinner",
          "tagline": "",
          "description": "Evening meals with a special touch.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/dinner+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Dinner.png",
          "order": 6
        },
        {
          "id": 5,
          "name": "Music",
          "tagline": "",
          "description": "Live tunes & good vibes all around.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/music+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Music.png",
          "order": 7
        },
        {
          "id": 18,
          "name": "Travel",
          "tagline": "",
          "description": "Quick escapes to new places.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/travel+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Travel.png",
          "order": 8
        },
        {
          "id": 15,
          "name": "Liquor Tasting",
          "tagline": "",
          "description": "Sip fine spirits with friends.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/lt+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Liquor+Tasting.png",
          "order": 9
        },
        {
          "id": 24,
          "name": "Weekend Getaway",
          "tagline": "",
          "description": "Short trips, big memories.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/weekend+gateaway+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Weekend+Gataway.png",
          "order": 10
        },
        {
          "id": 17,
          "name": "Outdoor",
          "tagline": "",
          "description": "Breathe fresh air & explore nature.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/outdoor+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Outdoor.png",
          "order": 11
        },
        {
          "id": 6,
          "name": "Art and Craft",
          "tagline": "",
          "description": "Get creative with hands-on art.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/a%26c+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Art+and+Craft.png",
          "order": 12
        },
        {
          "id": 4,
          "name": "Food Walk",
          "tagline": "",
          "description": "Explore city flavors on foot.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/food+walk+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Food+Walk.png",
          "order": 13
        },
        {
          "id": 19,
          "name": "Comedy Club",
          "tagline": "",
          "description": "Laugh out loud with stand-up acts.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/cc+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Comedy+club.png",
          "order": 14
        },
        {
          "id": 14,
          "name": "Games",
          "tagline": "",
          "description": "Play, compete & laugh together.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/games+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Games.png",
          "order": 15
        },
        {
          "id": 25,
          "name": "Dance",
          "tagline": "",
          "description": "Hit the floor & move to the beat.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/dance+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Dance.png",
          "order": 16
        },
        {
          "id": 2,
          "name": "Cook Fest",
          "tagline": "",
          "description": "Cook, compete & share tasty creations.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/cook+fest+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Cook+Fest.png",
          "order": 17
        },
        {
          "id": 3,
          "name": "Lit Meet",
          "tagline": "",
          "description": "Books, poetry & meaningful talks.",
          "image_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experiences/lit+meet+2.png",
          "icon_url":
              "https://d9uvs0t2o3h8z.cloudfront.net/assets/experience-stamps/Lit+Meet.png",
          "order": 18
        }
      ];
      return ExperienceModel.fromJsonList(mockJson);
    }
    try {
      logger.f("real data");
      final data = await dio.get("experiences?active=true");
      final expList = data.data['data']['experiences'] as List;
      return ExperienceModel.fromJsonList(expList);
    } on DioException catch (e) {
      throw e.response?.data;
    }
  }
}
