import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part 'item_model.g.dart';

enum ItemsSortType { normal, reverse }

class Item {
  final String name;
  final String description;

  const Item({required this.name, required this.description});

  Item.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        description = json["description"];
}

//NotifierProvider
@riverpod
class Items extends _$Items {
  @override
  List<Item> build() {
    return [];
  }

  void addItem(Item item) {
    state = [...state, item];
    ref.read(itemCountProvider.notifier).increment();
    ref.read(changeNotifierItemCountProvider).increment();
  }

  void removeItem(String itemName) {
    state = [
      for (final item in state)
        if (item.name != itemName) item
    ];
    ref.read(itemCountProvider.notifier).decrement();
    ref.read(changeNotifierItemCountProvider).decrement();
  }

  void sortItems(ItemsSortType type) {
    if (type == ItemsSortType.normal) {
      state.sort((a, b) {
        return a.name.toLowerCase().compareTo(b.name.toLowerCase());
      });
    } else {
      state.sort((a, b) {
        return b.name.toLowerCase().compareTo(a.name.toLowerCase());
      });
    }
  }
}

//StateProvider
@riverpod
final itemSortTypeProvider = StateProvider<ItemsSortType>(
  // We return the default sort type, here name.
  (ref) => ItemsSortType.normal,
);

@riverpod
Future<List<Item>> getItemFuture(GetItemFutureRef ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return [
    Item(name: "FutureItemName1", description: "Future item ome"),
    Item(name: "FutureItemName2", description: "Future item two")
  ];
}

//StateNotifierProvider
class ItemCountProvider extends StateNotifier<int> {
  ItemCountProvider() : super(0);

  void increment() => state += 1;

  void decrement() => state -= 1;
}

final itemCountProvider = StateNotifierProvider<ItemCountProvider, int>((ref) {
  return ItemCountProvider();
});

//ChangeNotifierProvider
class ItemCounteChangeNotifier extends ChangeNotifier {
  var count = 0;

  void increment() {
    count += 1;
    notifyListeners();
  }

  void decrement() {
    count -= 1;
    notifyListeners();
  }
}

final changeNotifierItemCountProvider =
    ChangeNotifierProvider<ItemCounteChangeNotifier>((ref) {
  return ItemCounteChangeNotifier();
});

//AsyncNotifierProvider
@riverpod
class ItemsAsync extends _$ItemsAsync {
  Future<List<Item>> _fetchItems(
      {Item item = const Item(
          name: "FutureItemName2", description: "Future item two")}) async {
    await Future.delayed(Duration(seconds: 3));
    var items = [
      Item(name: "FutureItemName1", description: "Future item ome"),
    ];
    items.add(item);
    return items;
  }

  @override
  FutureOr<List<Item>> build() async {
    return _fetchItems();
  }

  Future<void> addItem(Item item) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await Future.delayed(Duration(seconds: 1));
      return _fetchItems(item: item);
    });
  }
}
