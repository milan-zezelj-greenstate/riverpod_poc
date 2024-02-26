# Riverpod

## About
Riverpod is a framework that helps with asynchronous code. 
With this framework we can easily call API requests and handle error and loading states. 
It also helps us seperate the UI code from the logic.

## Usage
It uses shared states, where we can tag class or a function with "@riverpod" tag and then use it as a shared state.
After tagging it, we can access its state through multiple widgets.

## Example

For an example we can make a home screen, which will present a list of items.
When we want to load those items from an API request, we make a funtion to fetch the data and tag it as a @riverpod function.
Whenever we want to fetch that data again (get updated items from server), we just call the function and the widgets get rebuilt automatically.
Also, we can access that same data from another screen to, as an example, show the detailed preview of that item.
So whatever we change, the changes will be saved into the shared state and it can be accessed from any widget in the app.

### Code
 We first wrap the app in a ProviderScope class

```
void main() {
  runApp(
    // To install Riverpod, we need to add this widget above everything else.
    // This should not be inside "MyApp" but as direct parameter to "runApp".
    ProviderScope(
      child: MyApp(),
    ),
  );
}
```

Then we make a model

```
class Item with _$Item{
    factory Item({
        required String name,
        required String description,
    }) = _Item;

    factory Item.fromJson(Map<String, dynamic> json) => _ItemFromJson(json);
}
```

After that we make a function that is going to query the API

```
@riverpod
Future<Item> getItem(ItemRef ref) async {
    final response = await http.get(Uri.https('apiurl.com', '/api/v0/item'));

    return Item.fromJson(jsonDecode(response.body));
}
```

Now that we can fetch the item, we can present it on the screen using the Consumer widget.

```
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
       
        final AsyncValue<Item> activity = ref.watch(activityProvider);

        return Center(
          
          child: switch (activity) {
            AsyncData(:final value) => Text('Item: ${value.name}'),
            AsyncError() => const Text('Could not load the Item'),
            _ => const CircularProgressIndicator(),
          },
        );
      },
    );
  }
}
```