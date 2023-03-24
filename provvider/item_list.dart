class ItemList with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items => _items;

  Future<void> fetchItems() async {
    final response = await http.get(Uri.parse('http://localhost:3000/items'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonItems = json.decode(response.body);
      final items = jsonItems.map((json) => Item.fromJson(json)).toList();
      _items = items;
      notifyListeners();
    } else {
      throw Exception('Failed to load items');
    }
  }
}
