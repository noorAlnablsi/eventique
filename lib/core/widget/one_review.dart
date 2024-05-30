import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventique/providers/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class OneReview extends StatelessWidget {
  const OneReview({
    super.key,
    required this.rating,
    required this.personName,
    required this.theComment,
    required this.imgurl,
    required this.serviceId,
    required this.reviewIndex,
  });
  final double? rating;
  final String personName, theComment, imgurl;
  final int serviceId, reviewIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        if (personName == 'me') {
          showDialog<void>(
            context: context,
            builder: (BuildContext dialogContext) {
              return AlertDialog(
                backgroundColor: Color(0xFFFFFDF0),
                content: Text('Delete this review?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 18)),
                actions: <Widget>[
                  TextButton(
                    child: Text('No',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.normal)),
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Yes',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.normal)),
                    onPressed: () {
                      Provider.of<Reviews>(context, listen: false)
                          .deleteReview(serviceId, reviewIndex);
                      Navigator.of(dialogContext).pop();
                    },
                  ),
                ],
              );
            },
          ).then((_) {
            // To not open the keyboard
            FocusManager.instance.primaryFocus?.unfocus();
          });
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          right: 16,
          left: 16,
          bottom: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: imgurl,
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
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(personName,
                      style: Theme.of(context).textTheme.bodyMedium),
                  (rating != 0)
                      ? RatingBarIndicator(
                          unratedColor: Color.fromARGB(255, 207, 207, 207),
                          rating: rating!,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Color(0xffEBC25C),
                          ),
                          itemCount: 5,
                          itemSize: 18.0,
                          direction: Axis.horizontal,
                        )
                      : Container(),
                  SizedBox(height: 8),
                  ReadMoreText(
                    theComment,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Bahnschrift',
                        fontWeight: FontWeight.w400,
                        color: Color(0xff662465)),
                    trimLines: 3,
                    colorClickableText: const Color.fromARGB(255, 78, 152, 212),
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Read more',
                    trimExpandedText: ' Read less',
                    moreStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Color.fromARGB(255, 86, 162, 224)),
                    lessStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Color.fromARGB(255, 86, 162, 224)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
