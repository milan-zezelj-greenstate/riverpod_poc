import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc/models/item_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    List<Item> items = ref.watch(itemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod POC"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text("Name: "),
                            Text(items[index].name),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text("Description: "),
                            Text(items[index].description),
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
                      controller: _nameController,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _descriptionController,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ref.read(itemsProvider.notifier).addItem(Item(
                          name: _nameController.text,
                          description: _descriptionController.text));
                    },
                    child: Text("Add"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ref
                          .read(itemsProvider.notifier)
                          .removeItem(_nameController.text);
                    },
                    child: Text("Remove"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
