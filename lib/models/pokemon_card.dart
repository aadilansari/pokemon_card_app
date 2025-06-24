class PokemonCard {
  final String id;
  final String name;
  final String imageUrl;
  final List<String>? types;
  final List<dynamic>? attacks;
  final List<dynamic>? weaknesses;
  final String? artist;
  final Map<String, dynamic>? set;

  PokemonCard({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.types,
    this.attacks,
    this.weaknesses,
    this.artist,
    this.set,
  });

  factory PokemonCard.fromJson(Map<String, dynamic> json) {
    return PokemonCard(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imageUrl: json['images']['small'] ?? '',
      types: json['types']?.cast<String>(),
      attacks: json['attacks'],
      weaknesses: json['weaknesses'],
      artist: json['artist'],
      set: json['set'],
    );
  }
}
