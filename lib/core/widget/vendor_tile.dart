import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VendorTile extends StatelessWidget {
  const VendorTile({super.key,required this.vendorname});
  final String vendorname;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.fromLTRB(24, 12, 30, 24),
      child: Row(
        children: [
          
          CachedNetworkImage(
              imageUrl: 'https://i.postimg.cc/y6rkV8QR/photo-2024-04-25-23-30-27.jpg',
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 24,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => CircleAvatar(
                child: Container(
                  color: const Color.fromARGB(255, 230, 230, 230),
                ),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                child: Container(
                  color: const Color.fromARGB(255, 230, 230, 230),
                ),
              ),
            ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vendor',
                style:  Theme.of(context).textTheme.bodyMedium!.copyWith(color: Color.fromARGB(255, 226, 147, 168))
              ),
              Text(
                vendorname,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
              ),
            ],
          ),
          Spacer(),
          IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.commentDots,size: 22.0,color: Theme.of(context).primaryColor),)
        ],
      ),
    );
  }
}