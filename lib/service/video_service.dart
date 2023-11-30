import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/video_model.dart';





class VideoServices {
  Future<List<Results>> getVideoServices(BuildContext context) async {
    List <Results>getData=[];

    try {
      final String url = "https://test-ximit.mahfil.net/api/trending-video/1?page=1";

      Map<String, String> headers = {
        "Accept": "application/json",
        // "Authorization": "Bearer 141|e81hoIXtG52xjpr5ujEZhZhOZcN4m1qoqtqoZCZE"
      };

      http.Response res = await http.get(Uri.parse(url), headers: headers);
      print("getDiseasesServices data${res.body}");

      if (res.statusCode == 200) {
        var jsonRes = jsonDecode(res.body);
        print(jsonRes);

        VideoModel comapanyModel = VideoModel.fromJson(jsonRes);

        for (Results data in comapanyModel.results!) {
          // await ItemDbHelper.dbHelper.insertNewRecipe(data);
          getData.add(data);
        }
      } else {}
    } catch (e) {
      print(e.toString());
    }
    return getData;
  }
}