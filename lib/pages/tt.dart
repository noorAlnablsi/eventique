// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// class ImageSliderScreen extends StatefulWidget {
//   const ImageSliderScreen({super.key, required this.imgList});
//   final List<String> imgList;

//   @override
//   _ImageSliderScreenState createState() => _ImageSliderScreenState();
// }

// class _ImageSliderScreenState extends State<ImageSliderScreen> {
//   int _current = 0;
//   final CarouselController _controller = CarouselController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Image Slider"),
//       ),
//       body: Column(
//         children: [
//           CarouselSlider(
//             items: widget.imgList.map((item) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                     child: CachedNetworkImage(
//                       width: double.infinity,
//                       imageUrl: item,
//                       fit: BoxFit.cover,
//                       placeholder: (context, url) => Container(
//                         color: const Color.fromARGB(255, 230, 230, 230),
//                       ),
//                       errorWidget: (context, url, error) => Container(
//                         color: const Color.fromARGB(255, 230, 230, 230),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//             carouselController: _controller,
//             options: CarouselOptions(
//               enlargeCenterPage: true,
//               height: 400,
//               viewportFraction: 0.8,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _current = index;
//                 });
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: widget.imgList.asMap().entries.map((entry) {
//               return GestureDetector(
//                 onTap: () => _controller.animateToPage(entry.key),
//                 child: Container(
//                   width: 12.0,
//                   height: 12.0,
//                   margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: (Theme.of(context).primaryColor)
//                         .withOpacity(_current == entry.key ? 1.0 : 0.4),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // void main() {
// //   runApp(MaterialApp(
// //     home: ImageSliderScreen(
// //       imgList: [
// //         'https://via.placeholder.com/600x400',
// //         'https://via.placeholder.com/600x400',
// //         'https://via.placeholder.com/600x400',
// //       ],
// //     ),
// //   ));
// // }

import 'package:eventique/core/widget/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TTGRID extends StatelessWidget {
  const TTGRID({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.builder(
        itemCount: 6,
        gridDelegate:  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2), 
      itemBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          //color: const Color.fromARGB(255, 46, 91, 127),
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: ItemCard( firsttext: "Red Roses", secondtext:"Sufian", image: "images/image.png")),
        ),
      )),
    );
  }
}