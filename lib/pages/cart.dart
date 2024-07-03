import 'package:eventique/pages/service_details.dart';
import 'package:eventique/providers/carts.dart';
import 'package:eventique/providers/orders.dart';
import 'package:eventique/widget/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestCart extends StatelessWidget {
  const TestCart({super.key});
  // eventName;
  //eventId

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Carts>(context);
    //eventId below
    final cart = cartProvider.getCart(1);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          //eventName below
          'eventName',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontFamily: 'IrishGrover'),
        ),
      ),
      body: Container(
          child: cart.isEmpty
              ? Center(
                  child: Text(
                    'Cart Is Empty',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: 'IrishGrover',
                          fontSize: 22,
                          color: const Color.fromARGB(255, 227, 181, 193),
                        ),
                  ),
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
                          child: Container(
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
                                //eventId below
                                eventId:1
                              ),
                            ),
                          ),
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
                            height: 300,
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
                            child: Text('text'),
                          ),
                        ),

                        // Expanded(
                        //   child: ListView.builder(
                        //     itemCount: cart.length,
                        //     itemBuilder: (ctx, i) => Card(
                        //       child: ListTile(
                        //         onTap: () {
                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (ctx) => ServiceDetails(
                        //                 serviceId: cart.keys.toList()[i],
                        //               ),
                        //             ),
                        //           );
                        //         },
                        //         leading: Text(
                        //             'this serv quantity is ${cart[cart.keys.toList()[i]]!.quantity}'),
                        //         title: Text(
                        //             'this servprice is  ${cart[cart.keys.toList()[i]]!.totalPrice}'),
                        //       ),
                        //     ),
                        //   ),
                        // ),

                        ElevatedButton(
                          onPressed: () {
                            //eventId below in gettotalPrice and after and in clear cart
                            Provider.of<Orders>(context, listen: false)
                                .addOrder(
                              cart.values.toList(),
                              // eventId
                              cartProvider.getOrderTotalPrice(1),
                              'eventName',
                            );
                            cartProvider.clearCart(1);
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
