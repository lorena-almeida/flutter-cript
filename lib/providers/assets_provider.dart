import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/digital_asset.dart';

class AssetsProvider with ChangeNotifier {
  List<DigitalAsset> _assets = [];
  bool _isLoading = false;
  String _error = '';

  List<DigitalAsset> get assets => [..._assets];
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchAssets() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false',
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _assets = data.map((json) => DigitalAsset.fromJson(json)).toList();
      } else {
        _error = 'Falha ao carregar dados. Tente novamente.';
      }
    } catch (e) {
      _error = 'Erro de conexão. Verifique sua internet.';
    }

    _isLoading = false;
    notifyListeners();
  }

  DigitalAsset? getAssetById(String id) {
    try {
      return _assets.firstWhere((asset) => asset.id == id);
    } catch (e) {
      return null;
    }
  }
} 