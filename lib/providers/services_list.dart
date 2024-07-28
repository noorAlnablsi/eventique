// import 'package:eventique/models/one_service.dart';
// import 'package:flutter/material.dart';

// enum ServiceCategories {
//   venue,
//   catering,
//   flowers,
//   cake,
//   accesories,
//   photography,
//   entertainment,
//   decoration,
//   transportation,
// }

// class AllServices with ChangeNotifier {

//   String chosenCategory = 'All';
//   final List<OneService> _allServices = [
//     OneService(
//       serviceId: 1,
//       category: ServiceCategories.cake,
//       name: 'Dream Cake',
//       rating: 4.5,
//       vendorName: 'Bee',
//       imgsUrl: [
//         'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
//         'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
//         'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg'
//       ],
//       price: 24,
//       description:
//           'Indulge in our signature Velvet Symphony, a luxurious cake thats as much a feast for the eyes as it is for the palate. Each layer of this sumptuous treat is a harmonious blend of rich, moist red velvet cake, intertwined with delicate swirls of classic cream cheese frosting. Adorned with a crown of hand-piped rosettes and a sprinkle of edible gold dust, this cake is the perfect centerpiece for any celebration. Experience a taste of opulence with every slice',
//     ),
//     OneService(
//       serviceId: 2,
//       category: ServiceCategories.flowers,
//       name: 'Red Roses',
//       rating: 4.1,
//       vendorName: 'Sufian',
//       imgsUrl: [
//         'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
//         'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
//         'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg'
//       ],
//       description:
//           'They arrived in pristine condition, each rose vibrant and fragrant. Theyve been sitting on my dining table for over a week and still look as fresh as day one',
//       price: 30,
//     ),
//     OneService(
//       serviceId: 3,
//       category: ServiceCategories.venue,
//       name: 'Royal Hall',
//       rating: 3,
//       vendorName: 'mimi',
//       imgsUrl: [
//         'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg',
//         'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
//         'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
//       ],
//       price: 49,
//       description: 'The staff was attentive, the ballroom was stunning',
//     ),
//     OneService(
//       serviceId: 4,
//       category: ServiceCategories.catering,
//       name: 'taboleh',
//       rating: 1.1,
//       vendorName: 'soso',
//       imgsUrl: [
//         'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
//         'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg',
//         'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
//         'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
//       ],
//       price: 188,
//       description:
//           'Refresh your senses with our Garden Fresco Salad, a vibrant tapestry of the seasons best. Crisp romaine lettuce, heirloom cherry tomatoes, and cool cucumber ribbons lay the foundation for a refreshing experience. Tossed with crunchy croutons, a sprinkle of feta cheese, and a light, zesty lemon-herb vinaigrette, this salad is a celebration of freshness. Perfect for a healthy lunch or a side to any entrée, our Garden Fresco Salad invites you to savor the bounty of the garden in every bite.',
//     ),
//     OneService(
//       serviceId: 5,
//       category: ServiceCategories.cake,
//       name: 'red velvet',
//       rating: 2,
//       vendorName: 'Lala',
//       imgsUrl: [
        // 'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
        // 'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
        // 'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg',
        // 'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
        // 'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
//       ],
//       price: 379,
//       description:
//           'Behold the Choco Indulgence, a cake that promises to take you on a journey of chocolate bliss. This decadent masterpiece features layers of moist, dark chocolate sponge cake, each one enrobed in a velvety ganache that melts in your mouth. The cake is finished with a lattice of chocolate drizzle and adorned with handcrafted truffles, creating a visual and sensory delight. Ideal for the chocolate connoisseur, the Choco Indulgence is a tribute to the timeless love affair with chocolate.',
//     ),
//   ];

//   List<OneService> get allServices {
//     return [..._allServices];
//   }

//   void changeCategory(String newchoosedcategory) {
//     chosenCategory = newchoosedcategory;
//     notifyListeners();
//   }

//   OneService findById(int id) {
//     return _allServices.firstWhere((element) => element.serviceId == id);
//   }

//   List<OneService> categorizedServices() {
//     if (chosenCategory == 'All') {
//       return [..._allServices];
//     }
//     return allServices
//         .where((element) => element.category.name == chosenCategory)
//         .toList();
//   }

//   int _indexForBotomContent = 0;

//   int get indexForBotomContent => _indexForBotomContent;

//   void changeIndexforBottom(int newIndex) {
//     _indexForBotomContent = newIndex;
//     notifyListeners();
//   }
// }

import 'package:eventique/models/one_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AllServices with ChangeNotifier {
  AllServices() {
    _fetchCategories();
    fetchAllServices();
  }

 List<OneService> _allServices = [];
  List<OneService> get allServices => [..._allServices];

  String chosenCategory = 'All';
  List<Category> _categories = [];
  final CategoryService _categoryService = CategoryService();
  final ServicesService _servicesService= ServicesService();
  final SearchService _searchService=SearchService();

  Future<void> _fetchCategories() async {
    final fetchedCategories = await _categoryService.fetchCategories();
    _categories = fetchedCategories;
    notifyListeners();
  }

  Future<void> fetchAllServices() async {
    final fetchAllServices = await _servicesService.fetchAllServices();
    _allServices = fetchAllServices;
    notifyListeners();
  }

  Future<void> fetchCategorizedServices() async {
    print('chooooosen categoryyyyyyyy $chosenCategory');
    print('i am in fetchCategorizedServices');
    final fetchCategorizedServices = await _servicesService.fetchCategorizedServices(_categories.firstWhere((element) => element.name==chosenCategory).id);
    _allServices = fetchCategorizedServices;
    notifyListeners();
  }

  List<Category> get categories => [..._categories];

  void changeCategory(String newchoosedcategory) {
    chosenCategory = newchoosedcategory;
    if(newchoosedcategory=='All'){
      fetchAllServices();
    }
    else{
      fetchCategorizedServices();
    }
    
    notifyListeners();
  }

  OneService findById(int id) {
    return _allServices.firstWhere((element) => element.serviceId == id);
  }

  List<OneService> categorizedServices() {
    print('_allServicesssssssssssssssssss${_allServices.length}');
      return [..._allServices];
    
  }

// below we are handling the search
  //  List<OneService> searchResults=[];
  Future<List<OneService>> getSearchInAll(String text,) async {
    if(chosenCategory=='All'){
      final fetchAllServices = await _searchService.getSearchInAll(text);
    return fetchAllServices;
    }
    else{
      final fetchAllServices = await _searchService.getSearchInCategory(text,_categories.firstWhere((element) => element.name==chosenCategory).id);
    return fetchAllServices;
    }
    
  }



// below we are handling tab cahnging in service details
  int _indexForBotomContent = 0;
  int get indexForBotomContent => _indexForBotomContent;

  void changeIndexforBottom(int newIndex) {
    _indexForBotomContent = newIndex;
    notifyListeners();
  }
}

//.........................http................................................

class CategoryService {
  final String apiUrl = 'http://192.168.1.102:8000/api/categories';

  Future<List<Category>> fetchCategories() async {
    print('I am in fetchCategoriessssssssssssssss and going to get them');

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Accept': 'application/json',
        'locale': 'en', // or 'en' depending on your requirement
      },
    );
    if (response.statusCode == 200) {
      print('I am in the fetchCategoriessssssssssssss 200');
      final data = jsonDecode(response.body);
      final categories = data['data'] as List;
      return categories.map((e) {
        return Category(id: e['id'], name: e['name']);
      }).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

class ServicesService {
  final String apiUrl1 = 'http://192.168.1.102:8000/api/services';
  // final String apiUrl2 = 'http://192.168.1.102:8000/api/categories/1/services';

  Future<List<OneService>> fetchAllServices() async {
    final response = await http.get(
      Uri.parse(apiUrl1),
      headers: {
        'Accept': 'application/json',
        'locale': 'en', // or 'en' depending on your requirement
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final allServices = data['data'] as List;

      return allServices.map((e) {
        List<String> imageUrls = [];
        if (e['images'] != null) {
          imageUrls = (e['images'] as List)
              .map((img) => img['url'].toString())
              .toList();
        }

        return OneService(
          serviceId: e['id'],
          categoryId: e['category_id'],
          description: e['description'],
          imgsUrl: imageUrls,
          name: e['name'],
          price: double.parse(e['price'].toString()),  // Ensure price is parsed as double
          rating: e['average_rating'] != null ? double.parse(e['average_rating'].toString()) : null,  // Ensure rating is parsed as double
          vendorName: e['company_name'],
        );
      }).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }

  Future<List<OneService>> fetchCategorizedServices(int categoryId) async {
      final String apiUrl2 = 'http://192.168.1.102:8000/api/categories/$categoryId/services';
    final response = await http.get(
      Uri.parse(apiUrl2),
      headers: {
        'Accept': 'application/json',
        'locale': 'en', // or 'en' depending on your requirement
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final allServices = data['data'] as List;

      return allServices.map((e) {
        List<String> imageUrls = [];
        if (e['images'] != null) {
          imageUrls = (e['images'] as List)
              .map((img) => img['url'].toString())
              .toList();
        }

        return OneService(
          serviceId: e['id'],
          categoryId: e['category_id'],
          description: e['description'],
          imgsUrl: imageUrls,
          name: e['name'],
          price: double.parse(e['price'].toString()),  // Ensure price is parsed as double
          rating: e['average_rating'] != null ? double.parse(e['average_rating'].toString()) : null,  // Ensure rating is parsed as double
          vendorName: e['company_name'],
        );
      }).toList();
    } else {
      throw Exception('Failed to load services');
    }
  }
}


class SearchService {
  final String apiUrl1 = 'http://192.168.1.102:8000/api/search/all';

  Future<List<OneService>> getSearchInAll(String text) async {
    print('I am in getSearchInAllllllllllllllll and going to get them');

    final response = await http.post(
      Uri.parse(apiUrl1),
      headers: {
        'Accept': 'application/json',
        'locale': 'en', // or 'en' depending on your requirement
      },
      body:{
        'search_text':text
      } ,
    );

    if (response.statusCode == 200) {
      print('iam in getSearchInAlllllllllllllllllll 200');
      final data = jsonDecode(response.body);
      final allServices = data['services'] as List;

      return allServices.map((e) {
        List<String> imageUrls = [];
        if (e['images'] != null) {
          imageUrls = (e['images'] as List)
              .map((img) => img['url'].toString())
              .toList();
        }

        return OneService(
          serviceId: e['id'],
          categoryId: e['category_id'],
          description: e['description'],
          imgsUrl: imageUrls,
          name: e['name'],
          price: double.parse(e['price'].toString()),  // Ensure price is parsed as double
          rating: e['average_rating'] != null ? double.parse(e['average_rating'].toString()) : null,  // Ensure rating is parsed as double
          vendorName: e['company_name'],
        );
      }).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<OneService>> getSearchInCategory(String text,int categoryId) async {
    final String apiUrl2 = 'http://192.168.1.102:8000/api/search/$categoryId';

    print('I am in getSearchIncatttttttttt and going to get them');

    final response = await http.post(
      Uri.parse(apiUrl2),
      headers: {
        'Accept': 'application/json',
        'locale': 'en', // or 'en' depending on your requirement
      },
      body:{
        'search_text':text
      } ,
    );

    if (response.statusCode == 200) {
      print('iam in getSearchIncatttttttttt 200');
      final data = jsonDecode(response.body);
      final allServices = data['services'] as List;

      return allServices.map((e) {
        List<String> imageUrls = [];
        if (e['images'] != null) {
          imageUrls = (e['images'] as List)
              .map((img) => img['url'].toString())
              .toList();
        }

        return OneService(
          serviceId: e['id'],
          categoryId: e['category_id'],
          description: e['description'],
          imgsUrl: imageUrls,
          name: e['name'],
          price: double.parse(e['price'].toString()),  // Ensure price is parsed as double
          rating: e['average_rating'] != null ? double.parse(e['average_rating'].toString()) : null,  // Ensure rating is parsed as double
          vendorName: e['company_name'],
        );
      }).toList();
    }  else {
      throw Exception('Failed to load categories');
    }
  }
}



//.....................http model...
class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});
}
