import 'package:http/http.dart' as http;

class ItemState {
  final List<Item> items;

  ItemState({required this.items});

  factory ItemState.initial() {
    return ItemState(items: []);
  }

  Future<ItemState> fetchItems() async {
    final response = await http.get(Uri.parse('http://localhost:3000/items'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonItems = json.decode(response.body);
      final items = jsonItems.map((json) => Item.fromJson(json)).toList();
      return ItemState(items: items);
    } else {
      throw Exception('Failed to load items');
    }
  }
}
