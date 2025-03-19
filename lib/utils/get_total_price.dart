import 'package:open_trip/models/TripDataModel.dart';

int getTotalPrice(List<TripModel> list) {
  return list.fold(0, (total, trip) => total + trip.price);
}
