import "package:riverpod_annotation/riverpod_annotation.dart";

part 'item_model.g.dart';

class Item {
  String name;
  String description;

  Item({required this.name, required this.description});

  Item.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        description = json["description"];
}

@riverpod
class Items extends _$Items {
  @override
  List<Item> build() {
    return [];
  }

  void addItem(Item item) {
    state = [...state, item];
  }

  void removeItem(String itemName) {
    state = [
      for (final item in state)
        if (item.name != itemName) item
    ];
  }
}
