import 'package:eventique/color.dart';
import 'package:flutter/material.dart';

class CustomizeTile extends StatelessWidget {
  final String serviceId;
  final String serviceName;
  final String serviceImage;
  final String serviceDes;
  final String price;
  final String userName;
  final String userImage;
  final bool isMe;
  final Key key;

  const CustomizeTile(
      {required this.serviceImage,
      required this.serviceId,
      required this.serviceName,
      required this.serviceDes,
      required this.price,
      required this.userName,
      required this.userImage,
      required this.isMe,
      required this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe)
          CircleAvatar(
            backgroundImage: NetworkImage(
              userImage,
            ),
          ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(10),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(10),
            ),
            color: white,
          ),
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  color: primary,
                  fontFamily: 'CENSCBK',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                textAlign: isMe ? TextAlign.end : TextAlign.start,
              ),
              Text(
                'Original service',
                style: TextStyle(
                  color: secondary,
                  fontFamily: 'CENSCBK',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                serviceName,
                style: TextStyle(
                  color: primary,
                  fontFamily: 'CENSCBK',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'Original service',
                style: TextStyle(
                  color: secondary,
                  fontFamily: 'CENSCBK',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                serviceName,
                style: TextStyle(
                  color: primary,
                  fontFamily: 'CENSCBK',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      color: primary,
                      fontFamily: 'CENSCBK',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(87, 14, 87, 1),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.36, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Add to cart',
                      style: const TextStyle(
                        fontFamily: 'CENSCBK',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(255, 253, 240, 1),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
