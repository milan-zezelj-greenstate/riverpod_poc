import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc/models/item_model.dart';

class HomeScreenMNotifier extends ConsumerWidget {
  const HomeScreenMNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    List<Item> items = ref.watch(itemsProvider);
    int itemCount = ref.watch(itemCountProvider);
    ItemsSortType sortType = ref.watch(itemSortTypeProvider);

    ref.listen(itemSortTypeProvider,
        (previous, next) => ref.read(itemsProvider.notifier).sortItems(next));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod POC"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text("Sorted:"),
                ElevatedButton(
                  onPressed: () {
                    if (sortType == ItemsSortType.normal) {
                      ref.read(itemSortTypeProvider.notifier).state =
                          ItemsSortType.reverse;
                    } else {
                      ref.read(itemSortTypeProvider.notifier).state =
                          ItemsSortType.normal;
                    }
                  },
                  child: Text(sortType == ItemsSortType.normal ? "A-Z" : "Z-A"),
                ),
                Text("Item count: $itemCount"),
                Text("Item count changeNotifier: $itemCount"),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                "Name: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Expanded(
                                child: Text(items[index].name),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                "Description: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Expanded(
                                child: Text(
                                  items[index].description,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ref.read(itemsProvider.notifier).addItem(Item(
                              name: nameController.text,
                              description: descriptionController.text));
                        },
                        child: const Text("Add"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(itemsProvider.notifier)
                              .removeItem(nameController.text);
                        },
                        child: const Text("Remove"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
