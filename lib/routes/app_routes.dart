import 'package:get/get.dart';
import '../pages/home_page.dart';
import '../pages/detail_page.dart';
import '../models/pokemon_card.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(
      name: '/detail',
      page: () =>  DetailPage(card: PokemonCard(id: '', name: '', imageUrl: '')),
      transition: Transition.fadeIn,
    ),
  ];
}
