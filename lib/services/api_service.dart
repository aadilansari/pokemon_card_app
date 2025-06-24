import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:pokemon_card_app/models/pokemon_card.dart';

class ApiService {
  static const String baseUrl = 'https://api.pokemontcg.io/v2/cards';

  // Fetch list of Pokémon cards with pagination
  static Future<List<PokemonCard>> fetchPokemonCards({int page = 1}) async {
    final url = '$baseUrl?page=$page&pageSize=10';
    developer.log('Making API request to: $url');
    
    final response = await http.get(Uri.parse(url));
    
    // Log response details
    developer.log('Response Status Code: ${response.statusCode}');
    developer.log('Response Headers: ${response.headers}');
    developer.log('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List cards = data['data'];
      developer.log('Successfully parsed ${cards.length} cards');
      return cards.map((json) => PokemonCard.fromJson(json)).toList();
    } else {
      developer.log('API request failed with status: ${response.statusCode}');
      developer.log('Error response: ${response.body}');
      throw Exception('Failed to load cards: ${response.statusCode}');
    }
  }


  static Future<List<PokemonCard>> searchPokemonCards(String query) async {
    final url = '$baseUrl?q=set.name:$query';
    developer.log('Making search API request to: $url');
    
    final response = await http.get(Uri.parse(url));

    developer.log('Search Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List cards = data['data'];
      developer.log('Search returned ${cards.length} cards for query: "$query"');
      return cards.map((json) => PokemonCard.fromJson(json)).toList();
    } else {
      developer.log('Search API request failed with status: ${response.statusCode}');
      developer.log('Search error response: ${response.body}');
      throw Exception('Failed to search cards: ${response.statusCode}');
    }
  }
}