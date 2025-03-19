import 'package:bloc/bloc.dart';
import 'package:open_trip/models/TripDataModel.dart';

class CartCubit extends Cubit<List<TripModel>> {
  CartCubit() : super([]);

  void addToCart(TripModel trip) {
    emit([...state, trip]);
  }

  void removeFromCart(int id) {
    emit(state.where((item) => item.id != id).toList());
  }

  int get itemCount => state.length;
}
