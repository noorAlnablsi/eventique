enum ServiceCategories {
  venue,
  catering,
  flowers,
  cake,
  accesories,
  photography,
  entertainment,
  decoration,
  transportation,
}

class OneService {
  OneService(
      {required this.name,
      required this.vendorName,
      required this.imgsUrl,
      required this.rating,
      required this.category,
      required this.description,
       required this.price,
       required this.serviceId,
       });

  final String name, vendorName,description;
  final double rating,price;
  final ServiceCategories category;
  final List<String>? imgsUrl;
  final int serviceId;

}
