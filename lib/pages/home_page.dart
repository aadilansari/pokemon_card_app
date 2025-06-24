import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_card_app/controllers/pokemon_controller.dart';
import 'package:pokemon_card_app/pages/detail_page.dart';


class HomePage extends StatelessWidget {
  final PokemonController controller = Get.put(PokemonController());

  HomePage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.fetchInitialCards();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              _showSearchDialog(context);
            },
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.cards.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!controller.isSearching.value &&
                scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              controller.fetchMoreCards();
            }
            return false;
          },
          child: GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: controller.cards.length,
            itemBuilder: (context, index) {
              final card = controller.cards[index];
              return GestureDetector(
                onTap: () => Get.to(() => DetailPage(card: card)),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 4,
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,   // ← makes Column shrink to its children
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Hero(
                        tag: card.id,
                        child: Transform.translate(
                          
                          offset: Offset(0.0, 25.0),
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment.topCenter,
                              heightFactor: 0.56,
                              child: CachedNetworkImage(
                                imageUrl: card.imageUrl,
                                fit: BoxFit.cover,
                                placeholder: (c, _) =>
                                            const Center(child: CircularProgressIndicator()),
                                errorWidget: (c, _, __) => const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Transform.translate(
                          offset: Offset(0.0, 30.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            card.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )

              );
            },
          ),
        );
      }),
    );
  }

  void _showSearchDialog(BuildContext context) {
    Get.defaultDialog(
      title: 'Search Cards',
      titleStyle: TextStyle(fontWeight: FontWeight.bold),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(hintText: "e.g. generations"),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ButtonStyle(
    backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
    foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
    elevation: WidgetStateProperty.all<double>(4),
    padding: WidgetStateProperty.all<EdgeInsets>(
      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
              onPressed: () {
                Get.back();
                controller.searchCards(_searchController.text);
              },
              child: const Text("Search"),
            ),
            TextButton(
              onPressed: () {
                Get.back();
                controller.resetSearch();
              },
              child: const Text("Reset"),
            )
          ],
        ),
      ),
    );
  }
}
