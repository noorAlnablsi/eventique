import 'package:eventique/models/one_service.dart';

class OneShoppingListService {
  final OneService baseService;
  final int quantity;
  final double totalPrice;

  OneShoppingListService(
      {required this.baseService,
      required this.quantity,
      required this.totalPrice});
}
