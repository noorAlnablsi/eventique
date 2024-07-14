import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventique/models/one_cartService.dart';
import 'package:eventique/pages/service_details.dart';
import 'package:eventique/providers/carts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    Key? key,
    required this.cart,
    required this.i,
    required this.eventId,
  }) : super(key: key);

  final Map<int, OneCartService> cart;
  final int i;
  final String eventId;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Carts>(context);

    final service = cart[cart.keys.toList()[i]]!;
    final TextStyle? bodyMediumStyle = Theme.of(context).textTheme.bodyMedium;

    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xff662465), width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.fromLTRB(0, 14, 0, 8),
      color: const Color(0xFFFFFDF0),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => ServiceDetails(
                serviceId: cart.keys.toList()[i],
              ),
            ),
          );
        },
        onLongPress: () async {
          // Show a confirmation dialog
          await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
                backgroundColor: const Color(0xFFFFFDF0),
                content: Text('Remove from cart?',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 18,fontWeight: FontWeight.bold)),
                actions: <Widget>[
                  TextButton(
                    child: Text('No',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w500)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Yes',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w500)),
                    onPressed: () {
                       cartProvider.removeServiceFromCart(eventId, cart.keys.toList()[i]);
                        Navigator.of(context).pop();
                    },
                  ),
                ],
              )
          );

        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: service.imgUrl,
                  height: 80,
                  width: 66,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: const Color.fromARGB(255, 230, 230, 230),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: const Color.fromARGB(255, 230, 230, 230),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.name,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: bodyMediumStyle!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Price:',
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: bodyMediumStyle,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            flex: 2,
                            child: Text(
                              '${service.totalPrice.toStringAsFixed(1)}\$',
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: bodyMediumStyle.copyWith(
                                color: Color(0xffCCA0C7),
                              ),
                            ),
                          ),
                          Spacer(),
                          Flexible(
                            fit: FlexFit.loose,
                            flex: 2,
                            child: Text(
                              'Quantity: ',
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: bodyMediumStyle,
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Text(
                              '${service.quantity}',
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: bodyMediumStyle.copyWith(
                                color: Color(0xffCCA0C7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
