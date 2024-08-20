import 'dart:convert';
import 'dart:developer';

import 'package:catbreeds_app/src/models/breed_model/breed_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();
  final _baseUrl = "https://api.thecatapi.com/v1";

  Future<List<BreedModel>> searchBreedsData(String search) async {
    String api = "$_baseUrl/breeds";
    if (search.isNotEmpty) {
      api += "/search?q=$search";
    }
    try {
      final response = (await dio.get<List<dynamic>>(api));
      if (response.statusCode == 200) {
        var data = response.data;
        if (data != null) {
          List<String> jsonResponse = data.map((x) => jsonEncode(x)).toList();
          List<BreedModel> breedModels =
              jsonResponse.map((x) => BreedModel.fromJson(x)).toList();
          return breedModels;
        } else {
          log("Error, data is null.");
        }
      } else {
        log("Error, statusCode is ${response.statusCode}.");
      }
    } catch (ex) {
      log("Error, searchBreedsData exception: ${ex.toString()}.");
    }
    return [];
  }

  Future<String> getBreedImageUrl(String breedId) async {
    try {
      if (breedId.isNotEmpty) {
        final String apiImg = "$_baseUrl/images/search?&breed_ids=$breedId";
        final dio = Dio();
        final response = (await dio.get<List<dynamic>>(apiImg)).data?.first;
        return response["url"];
      } else {
        log("Error, getBreedImageUrl breedId is empty.");
      }
    } catch (ex) {
      log("Error, getBreedImageUrl exception: ${ex.toString()}.");
    }
    return "";
  }
}
