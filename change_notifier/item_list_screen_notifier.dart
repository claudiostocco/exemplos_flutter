class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final _itemList = ItemList();

  @override
  void initState() {
    super.initState();
    _itemList.fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ItemList>(
        builder: (context, itemList, child) {
          if (itemList.items.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: itemList.items.length,
              itemBuilder: (context, index) {
                final item = itemList.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.quantity.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
