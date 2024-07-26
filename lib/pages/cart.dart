import 'package:eventique/core/resources/color.dart';
import 'package:eventique/pages/vendors_screen.dart';
import 'package:eventique/providers/carts.dart';
import 'package:eventique/providers/orders.dart';
import 'package:eventique/widget/cart_tile.dart';
import 'package:eventique/widget/my_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestCart extends StatelessWidget {
  const TestCart({super.key,required this.eventId,required this.eventName,required this.eventBudget});
  final String eventName;
  final int eventId ;
  final double eventBudget ;

  @override
  Widget build(BuildContext context) {
    final TextStyle? bodyMediumStyle = Theme.of(context).textTheme.bodyMedium;
    final cartProvider = Provider.of<Carts>(context);
    final orderTotalPrice = cartProvider.getOrderTotalPrice(eventId);
    double availableBudget =
        eventBudget - orderTotalPrice >= 0 ? eventBudget - orderTotalPrice : 0;
    double exceededBudget = eventBudget - orderTotalPrice >= 0
        ? 0
        : -(eventBudget - orderTotalPrice);

    final cart = cartProvider.getCart(eventId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          eventName,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontFamily: 'IrishGrover'),
        ),
      ),
      body: Container(
          child: cart.isEmpty
              ? Stack(
                children: [
                  Center(
                      child: Text(
                        'Cart Is Empty',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontFamily: 'IrishGrover',
                              fontSize: 22,
                              color: const Color.fromARGB(255, 227, 181, 193),
                            ),
                      ),
                    ),
                     // Positioned circle button
                            Positioned(
                              bottom: 46,
                              right: 32,
                              child: FloatingActionButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) =>const VendorsScreen())));
                                  cartProvider.chosenEventId=eventId.toString();
                                },
                                 child: Icon(
                                  Icons.add,
                                  color: beige, 
                                ),
                                backgroundColor: Theme.of(context).primaryColor, 
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation:
                                    4, 
                                tooltip:
                                    'Add Service',
                              ),
                            ),
                ],
              )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //added services
                        Text(
                          'Added Services',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontFamily: 'IrishGrover'),
                        ),

                        //container
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Stack(children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 400, //500
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFFFFDF0),
                                boxShadow: [
                                  // Top-left shadow
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    offset: Offset(5, 5),
                                    blurRadius: 2,
                                    spreadRadius:
                                        -3, // Negative to simulate inner shadow
                                  ),
                                  // Bottom-right shadow
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    offset: Offset(-5, -5),
                                    blurRadius: 2,
                                    spreadRadius:
                                        -3, // Negative to simulate inner shadow
                                  ),
                                ],
                              ),
                              child: ListView.builder(
                                padding: EdgeInsets.all(12),
                                itemCount: cart.length,
                                itemBuilder: (ctx, i) => CartTile(
                                    cart: cart,
                                    i: i,
                                    eventId: eventId),
                              ),
                            ),

                            // Positioned circle button
                            Positioned(
                              bottom: 16,
                              right: 16,
                              child: FloatingActionButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: ((context) =>const VendorsScreen())));
                                  cartProvider.chosenEventId=eventId.toString();
                                },
                                 child: Icon(
                                  Icons.add,
                                  color: beige, 
                                ),
                                backgroundColor: Theme.of(context).primaryColor, 
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation:
                                    4, 
                                tooltip:
                                    'Add Service',
                              ),
                            ),
                          ]),
                        ),

                        //budget
                        Text(
                          'Budget',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontFamily: 'IrishGrover'),
                        ),

                        //container
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 400,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFFFFDF0),
                                boxShadow: [
                                  // Top-left shadow
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    offset: Offset(5, 5),
                                    blurRadius: 2,
                                    spreadRadius:
                                        -3, // Negative to simulate inner shadow
                                  ),
                                  // Bottom-right shadow
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.7),
                                    offset: Offset(-5, -5),
                                    blurRadius: 2,
                                    spreadRadius:
                                        -3, // Negative to simulate inner shadow
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(24),
                              child: Column(
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    flex: 2,
                                    child: Text(
                                      'Current Total: ${orderTotalPrice}\$',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontFamily: 'IrishGrover',
                                              fontSize: 17,
                                              letterSpacing: 1),
                                    ),
                                  ),
                                  SizedBox(height: 18),
                                  MyPieChart(
                                    cart: cart,
                                    totalPriceForOrder: orderTotalPrice,
                                  ),
                                  SizedBox(height: 38),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    flex: 2,
                                    child: Text(
                                      'Event Budget: ${eventBudget}\$',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontFamily: 'IrishGrover',
                                              fontSize: 17,
                                              letterSpacing: 1),
                                    ),
                                  ),
                                  const SizedBox(height: 18),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Available ',
                                        softWrap: false,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: bodyMediumStyle,
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        flex: 2,
                                        child: Text(
                                          '${availableBudget}\$',
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: bodyMediumStyle!.copyWith(
                                            color: Color(0xffCCA0C7),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        flex: 2,
                                        child: Text(
                                          'Exceeded ',
                                          softWrap: false,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: bodyMediumStyle,
                                        ),
                                      ),
                                      Text(
                                        '${exceededBudget}\$',
                                        softWrap: false,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: bodyMediumStyle!.copyWith(
                                          color: Color(0xffCCA0C7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),

                        ElevatedButton(
                          onPressed: () {
                            //eventId below in gettotalPrice and after and in clear cart
                            Provider.of<Orders>(context, listen: false)
                                .addOrder(
                              cart.values.toList(),
                              orderTotalPrice,
                              eventName,
                            );
                            cartProvider.clearCart(eventId);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor),
                          ),
                          child: const Text(
                            'Order',
                            style: TextStyle(
                                fontFamily: 'IrishGrover',
                                fontSize: 18,
                                color: Color(0xFFFFFDF0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }
}
