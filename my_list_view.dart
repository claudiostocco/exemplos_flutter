class MyListView extends StatefulWidget {
  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<Item> _items = [
    Item(name: 'Item 1', quantity: 1),
    Item(name: 'Item 2', quantity: 2),
    Item(name: 'Item 3', quantity: 3),
  ];
  
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _items.length; i++) {
      _controllers.add(TextEditingController(text: _items[i].name));
      _controllers.add(TextEditingController(text: _items[i].quantity.toString()));
    }
  }

  @override
  void dispose() {
    for (var i = 0; i < _controllers.length; i++) {
      _controllers[i].dispose();
    }
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: TextField(
            controller: _controllers[index * 2],
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          subtitle: TextField(
            controller: _controllers[index * 2 + 1],
            decoration: InputDecoration(
              labelText: 'Quantity',
            ),
          ),
        );
      },
    );
  }
}
