import 'package:catbreeds_app/src/models/breed_model/breed_model.dart';
import 'package:catbreeds_app/src/services/api_service.dart';
import 'package:flutter/material.dart';

class BreedProvider extends ChangeNotifier {
  List<BreedModel> _breeds = [];
  bool _isLoading = false;

  List<BreedModel> get breeds => _breeds;
  bool get isLoading => _isLoading;

  void loadInitialData() async {
    _isLoading = true;
    notifyListeners();

    _breeds = await ApiService().searchBreedsData("");

    _isLoading = false;
    notifyListeners();
  }

  void searchBreedsByFilter(String filter) async {
    _isLoading = true;
    notifyListeners();

    _breeds = await ApiService().searchBreedsData(filter);

    _isLoading = false;
    notifyListeners();
  }
}
