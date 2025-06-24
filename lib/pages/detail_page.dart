import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/pokemon_card.dart';

class DetailPage extends StatelessWidget {
  final PokemonCard card;

  const DetailPage({super.key, required this.card});

  Widget _buildInfoTile(String title, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, List<dynamic>? values) {
    if (values == null || values.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title:", style: const TextStyle(fontWeight: FontWeight.bold)),
          ...values.map((v) => Text("• ${v['name'] ?? v.toString()}")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(card.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Centered image
            Center(
              child: Hero(
                tag: card.id,
                child: CachedNetworkImage(
                  imageUrl: card.imageUrl,
                  height: 350,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Left-aligned text content
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoTile("Name", card.name),
                  _buildInfoTile("Artist", card.artist),
                  _buildInfoTile("Set", card.set?["name"]),
                  _buildInfoTile("Rarity", card.set?["rarity"]),
                  _buildInfoTile("Types", card.types?.join(', ')),
                  _buildListTile("Attacks", card.attacks),
                  _buildListTile("Weaknesses", card.weaknesses),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}