// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:pokemon_card_app/models/pokemon_card.dart';
import 'package:pokemon_card_app/services/api_service.dart';


class PokemonController extends GetxController {
  var cards = <PokemonCard>[].obs;
  var isLoading = false.obs;
  var page = 1.obs;
  var hasMore = true.obs;
  var isSearching = false.obs;

  void fetchInitialCards() async {
    isLoading.value = true;
    try {
      final data = await ApiService.fetchPokemonCards(page: 1);
      cards.value = data;
      page.value = 2;
      hasMore.value = data.length == 10;
    } catch (e) {
      print('Error: $e');
    }
    isLoading.value = false;
  }

  void fetchMoreCards() async {
    if (!hasMore.value || isLoading.value) return;

    isLoading.value = true;
    try {
      final data = await ApiService.fetchPokemonCards(page: page.value);
      cards.addAll(data);
      page.value++;
      hasMore.value = data.length == 10;
    } catch (e) {
      print('Error: $e');
    }
    isLoading.value = false;
  }

  void searchCards(String searchTerm) async {
    isSearching.value = true;
    isLoading.value = true;

    try {
      final result = await ApiService.searchPokemonCards(searchTerm);
      cards.value = result;
      hasMore.value = false; // Search results are not paginated
    } catch (e) {
      print('Error: $e');
    }

    isLoading.value = false;
  }

  void resetSearch() {
    isSearching.value = false;
    page.value = 1;
    hasMore.value = true;
    fetchInitialCards();
  }
}
