import 'dart:convert';

import 'package:aps_party/layers/domain/entity/party_agenda.dart';
import 'package:aps_party/layers/domain/entity/video_model.dart';
import 'package:aps_party/layers/domain/services/home_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class MyController extends GetxController {
  final DataService _dataService = DataService();
  var myData = <PartyAgendaModel>[].obs;
  var videoList = <VideoMode>[].obs;
  @override
  void onInit() {
    fetchData();
    getUserTweets('BhimArmyChief');
    super.onInit();
  }

  void fetchData() async {
    try {
      myData.value = await _dataService.fetchData();
      videoList.value = await _dataService.fetchDataFromVideo();
    } catch (e) {}
  }

  // Future<List<dynamic>> fetchTweetsByUsername(String username) async
  // {
  //   final String bearerToken = dotenv.env['TWITTER_BEARER_TOKEN']!;
  //   final String url =
  //       "https://api.twitter.com/2/tweets/search/recent?query=from:$username&tweet.fields=created_at,author_id";

  //   final response = await http.get(
  //     Uri.parse(url),
  //     headers: {
  //       'Authorization': 'Bearer $bearerToken',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     print("dshgidfugu");

  //     return json.decode(response.body)['data'];
  //   } else {
  //     throw Exception('Failed to load tweets');
  //   }
  // }

  final String _baseUrl = "https://api.twitter.com/2";
  final String _apiKey = dotenv.env['API_KEY']!;
  final String _apiKeySecret = dotenv.env['API_KEY_SECRET']!;
  final String _accessToken = dotenv.env['ACCESS_TOKEN']!;
  final String _accessTokenSecret = dotenv.env['ACCESS_TOKEN_SECRET']!;

  Future<List<dynamic>> getUserTweets(String username) async {
    print("kdjfhgkfghk  ${username}");
    final url = Uri.parse("$_baseUrl/tweets?screen_name=$username&count=10");
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $_accessToken',
      },
    );
    print("dfsgdsfgdsfgdf  ${response.body}");
    if (response.statusCode == 200) {
      print("success  ${username}");
      final data = jsonDecode(response.body);
      return data['statuses'];
    } else {
      print("dfsgsdfgsdfgdsfgdsfg  ${username}");
      print("dsfsdfsdfdfgdfgdfgdfgdfg  ${username}");
      throw Exception("Failed to load tweets");
    }
  }
}
