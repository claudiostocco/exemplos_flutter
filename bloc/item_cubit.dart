import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemState.initial());

  Future<void> loadItems() async {
    try {
      final state = await state.fetchItems();
      emit(state);
    } catch (e) {
      // Handle errors here
    }
  }
}
