import 'dart:convert';
import 'dart:developer';
import '../models/ship_facts.dart';
import 'package:http/http.dart' as http;

class ShipRepository {
  Future<ShipFacts> fetchShipFacts(String shipName) async {
    final response = await http.get(
        Uri.parse('https://www.ncl.com/cms-service/cruise-ships/$shipName'));

    switch (response.statusCode) {
      case 200:
        return ShipFacts.fromJson(jsonDecode(response.body));
      case 404:
        log('Ship not found');
        throw Exception('Ship not found');
      default:
        log('Failed to load ship facts');
        throw Exception('Failed to load ship facts');
    }
  }
}
