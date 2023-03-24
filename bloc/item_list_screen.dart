class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final _itemCubit = ItemCubit();

  @override
  void initState() {
    super.initState();
    _itemCubit.loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ItemCubit, ItemState>(
        bloc: _itemCubit,
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.quantity.toString()),
                );
              },
            );
          }
        },
     
