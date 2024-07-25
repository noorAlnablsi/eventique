import 'package:eventique/models/one_service.dart';

class Package {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  List<OneService>? packageServices;
  Package({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.packageServices,
  });
}
