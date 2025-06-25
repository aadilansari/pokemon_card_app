# Pokémon Card App

A lightweight Flutter application that displays Pokémon Trading Card Game (TCG) cards in a paginated 2 × 2 grid, with searchable filtering and detail views.

---

## 📱 Features

| Feature | Description |
|---------|-------------|
| **Paginated Grid** | Infinite‑scroll 2 × 2 grid built with `GridView`, pulling 10 cards at a time from the PokéTCG API. |
| **Search** | AppBar search dialog accepts any PokéTCG query syntax (e.g. `set.name:generations`). |
| **Detail Page** | Hero‑animated transition to a detail page that shows attacks, set, types, weaknesses, artist, rarity and more. |
| **State Management** | Entire state handled with **GetX** (`Get.put`, `Obx`) for a concise reactive flow. |
| **Image Caching** | Uses `cached_network_image` to cache card images locally and provide placeholders while loading. |
| **Routing** | Declarative navigation via `GetPage` and `Get.to()` for clean, testable transitions. |

---

## 🛠️ Tech Stack

- **Flutter 3.22** (stable)
- **GetX 4.6.5** – state, DI, & routing
- **cached_network_image 3.3.0** – disk & memory caching for images
- **http 0.14.0** – lightweight REST client

---

## 🚀 Getting Started

### Prerequisites

| Tool | Version |
|------|---------|
| Flutter SDK | ≥ 3.22 (stable) |
| Dart | ≥ 3.3 |
| Android Studio / VS Code | any, with Flutter & Dart plugins |

### Installation

```bash
# 1 Clone the repo
$ git clone https://github.com/<your‑username>/pokemon_card_app.git
$ cd pokemon_card_app

# 2 Install dependencies
$ flutter pub get

# 3 Run on device or simulator
$ flutter run
```

### Building Release APK (for submission)

```bash
flutter build apk --release --split-per-abi
# Output: build/app/outputs/flutter-apk/*.apk
```

---

## 🌐 API Reference

| Endpoint | Purpose |
|----------|---------|
| `GET https://api.pokemontcg.io/v2/cards?page=<n>&pageSize=10` | Paginated list (10 cards per page) |
| `GET https://api.pokemontcg.io/v2/cards?q=<query>` | Search cards using PokéTCG query syntax |

The app adds required headers automatically (`X-Api-Key` not required for public endpoints).

---

## 📂 Project Structure

```
lib/
├── bindings/                # (optional) future DI bindings
├── controllers/
│   └── pokemon_controller.dart
├── models/
│   └── pokemon_card.dart
├── pages/
│   ├── home_page.dart       # grid + search
│   └── detail_page.dart     # hero‑animated detail view
├── routes/
│   └── app_routes.dart
├── services/
│   └── api_service.dart
└── main.dart
```

---

## 📸 Screenshots



![p4](https://github.com/user-attachments/assets/934a7f43-4d83-4e1f-be72-bcc8687a4ab9)
![p3](https://github.com/user-attachments/assets/cca03562-c3f6-4b4f-a778-31218b5085f9)
![p2](https://github.com/user-attachments/assets/5964c513-482c-4dde-977a-cf71d14440e9)
![p1](https://github.com/user-attachments/assets/f55ba542-b0a7-4e1e-8e91-869976147178)

---

## 🗺️ Roadmap / Future Improvements

- **Pull‑to‑refresh** on the grid
- **Unit & widget tests** (mocked API)
- **Offline storage** using Hive/SQLite
- **Dark mode** theme support
- **CI/CD** pipeline (GitHub Actions)

---

## 🤝 Contributing

1. Fork the repo
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.


---

### Author

**Aadil Ansari** – [aadil.ansari8@gmail.com](mailto:aadil.ansari8@gmail.com)
