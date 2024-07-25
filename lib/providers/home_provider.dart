import 'package:eventique/main.dart';
import 'package:eventique/models/one_service.dart';
import 'package:eventique/models/package_model.dart';
import 'package:eventique/models/you_and_us_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeProvider with ChangeNotifier {
  List<Package> _packages = [
    Package(
        id: 0,
        name: 'birthday',
        description: 'this is package one',
        imageUrl: 'assets/images/Rectangle (3).png',
        packageServices: [
          OneService(
            serviceId: 1,
            category: ServiceCategories.cake,
            name: 'Dream Cake',
            rating: 4.5,
            vendorName: 'Bee',
            imgsUrl: [
              'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
              'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
              'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg'
            ],
            price: 24,
            description:
                'Indulge in our signature Velvet Symphony, a luxurious cake thats as much a feast for the eyes as it is for the palate. Each layer of this sumptuous treat is a harmonious blend of rich, moist red velvet cake, intertwined with delicate swirls of classic cream cheese frosting. Adorned with a crown of hand-piped rosettes and a sprinkle of edible gold dust, this cake is the perfect centerpiece for any celebration. Experience a taste of opulence with every slice',
          ),
          OneService(
            serviceId: 2,
            category: ServiceCategories.flowers,
            name: 'Red Roses',
            rating: 4.1,
            vendorName: 'Sufian',
            imgsUrl: [
              'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
              'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
              'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg'
            ],
            description:
                'They arrived in pristine condition, each rose vibrant and fragrant. Theyve been sitting on my dining table for over a week and still look as fresh as day one',
            price: 30,
          ),
        ]),
    Package(
      id: 1,
      name: 'holiday',
      description: 'this is package two',
      imageUrl: 'assets/images/Rectangle.png',
      packageServices: [
        OneService(
          serviceId: 3,
          category: ServiceCategories.venue,
          name: 'Royal Hall',
          rating: 3,
          vendorName: 'mimi',
          imgsUrl: [
            'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg',
            'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
            'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
          ],
          price: 49,
          description: 'The staff was attentive, the ballroom was stunning',
        ),
        OneService(
          serviceId: 4,
          category: ServiceCategories.catering,
          name: 'taboleh',
          rating: 1.1,
          vendorName: 'soso',
          imgsUrl: [
            'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
            'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg',
            'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
            'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
          ],
          price: 188,
          description:
              'Refresh your senses with our Garden Fresco Salad, a vibrant tapestry of the seasons best. Crisp romaine lettuce, heirloom cherry tomatoes, and cool cucumber ribbons lay the foundation for a refreshing experience. Tossed with crunchy croutons, a sprinkle of feta cheese, and a light, zesty lemon-herb vinaigrette, this salad is a celebration of freshness. Perfect for a healthy lunch or a side to any entrée, our Garden Fresco Salad invites you to savor the bounty of the garden in every bite.',
        ),
      ],
    ),
  ];
  List<YouAndUs> _youAndUs = [
    YouAndUs(
      id: 0,
      description: 'Magical',
      imagesUrl: ['assets/images/Rectangle.png'],
      eventServices: [
        OneService(
          serviceId: 1,
          category: ServiceCategories.cake,
          name: 'Dream Cake',
          rating: 4.5,
          vendorName: 'Bee',
          imgsUrl: [
            'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
            'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
            'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg'
          ],
          price: 24,
          description:
              'Indulge in our signature Velvet Symphony, a luxurious cake thats as much a feast for the eyes as it is for the palate. Each layer of this sumptuous treat is a harmonious blend of rich, moist red velvet cake, intertwined with delicate swirls of classic cream cheese frosting. Adorned with a crown of hand-piped rosettes and a sprinkle of edible gold dust, this cake is the perfect centerpiece for any celebration. Experience a taste of opulence with every slice',
        ),
        OneService(
          serviceId: 2,
          category: ServiceCategories.flowers,
          name: 'Red Roses',
          rating: 4.1,
          vendorName: 'Sufian',
          imgsUrl: [
            'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
            'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
            'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg'
          ],
          description:
              'They arrived in pristine condition, each rose vibrant and fragrant. Theyve been sitting on my dining table for over a week and still look as fresh as day one',
          price: 30,
        ),
        OneService(
          serviceId: 3,
          category: ServiceCategories.venue,
          name: 'Royal Hall',
          rating: 3,
          vendorName: 'mimi',
          imgsUrl: [
            'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg',
            'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
            'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
          ],
          price: 49,
          description: 'The staff was attentive, the ballroom was stunning',
        ),
        OneService(
          serviceId: 4,
          category: ServiceCategories.catering,
          name: 'taboleh',
          rating: 1.1,
          vendorName: 'soso',
          imgsUrl: [
            'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
            'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg',
            'https://i.postimg.cc/jSD6s14x/photo-2024-04-25-23-30-29.jpg',
            'https://i.postimg.cc/1XznvgWm/photo-2024-04-25-23-30-28.jpg',
          ],
          price: 188,
          description:
              'Refresh your senses with our Garden Fresco Salad, a vibrant tapestry of the seasons best. Crisp romaine lettuce, heirloom cherry tomatoes, and cool cucumber ribbons lay the foundation for a refreshing experience. Tossed with crunchy croutons, a sprinkle of feta cheese, and a light, zesty lemon-herb vinaigrette, this salad is a celebration of freshness. Perfect for a healthy lunch or a side to any entrée, our Garden Fresco Salad invites you to savor the bounty of the garden in every bite.',
        ),
      ],
    ),
  ];

  //packages
  List<Package> get allPackages {
    return [..._packages];
  }

  Package findPackageById(int id) {
    return _packages.firstWhere((element) => element.id == id);
  }

  //you and us
  List<YouAndUs> get allYouAndUs {
    return [..._youAndUs];
  }

  YouAndUs findYouAndUsById(int id) {
    return _youAndUs.firstWhere((element) => element.id == id);
  }

//fetch all packages from backend
//very basic may need edit
  Future<void> fetchPackages() async {
    final url = Uri.parse('$host/api/getallpackages');
    print(url);
    try {
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'locale': 'en',
        },
      );
      final responseData = json.decode(response.body);
      print(responseData);
      final packages = responseData['data'] as List<dynamic>;
      final List<Package> temp = [];
      packages.forEach((package) {
        temp.add(Package(
          id: package['id'],
          name: package['name'],
        ));
      });
      print(temp);
      _packages = temp;
      print(_packages);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

//fetch all you and us fromm backend
//very basic may need edit
  Future<void> fetchYouAndUs() async {
    final url = Uri.parse('$host/api/getyouandus');
    print(url);
    try {
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'locale': 'en',
        },
      );
      final responseData = json.decode(response.body);
      print(responseData);
      final youAndUsList = responseData['data'] as List<dynamic>;
      final List<YouAndUs> temp = [];
      youAndUsList.forEach((element) {
        temp.add(
          YouAndUs(
            id: element['id'],
            description: element['name'],
          ),
        );
      });
      print(temp);
      _youAndUs = temp;
      print(_youAndUs);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
