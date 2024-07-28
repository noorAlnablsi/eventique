import 'package:eventique/core/resources/color.dart';
import 'package:eventique/providers/saved.dart';
import 'package:eventique/widget/image_slider.dart';
import 'package:eventique/widget/my_bottom_appbar.dart';
import 'package:eventique/widget/my_tabBar.dart';
import 'package:eventique/widget/my_tabbarview.dart';
import 'package:eventique/providers/services_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({super.key, required this.serviceId});
  final int serviceId;

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);

    // Ensure the first tab is selected when the screen is re-entered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tabController.index = 0; // Reset to the first tab
      Provider.of<AllServices>(context, listen: false)
          .changeIndexforBottom(0); // Update provider as well
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<AllServices>(context, listen: false)
            .changeIndexforBottom(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loadedService = Provider.of<AllServices>(context, listen: false)
        .findById(widget.serviceId);
    final svaedProvider = Provider.of<Saved>(context);

    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(
        price: loadedService.price,
        serviceId: loadedService.serviceId,
        imgUrl: loadedService.imgsUrl![0],
        name: loadedService.name,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Theme(
            data: Theme.of(context).copyWith(
              useMaterial3: false, // Disable Material 3 for NestedScrollView
            ),
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  Theme(
                    data: Theme.of(context).copyWith(
                      useMaterial3: true, // Enable Material 3 for SliverAppBar
                    ),
                    child: SliverAppBar(
                      pinned: true,
                      floating: false,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(
                          loadedService.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontFamily: 'IrishGrover'),
                        ),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () {
                            if (svaedProvider.savedServices
                                .contains(loadedService)) {
                                  svaedProvider.delete(widget.serviceId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 76, 27, 75),
                                  content: Text(
                                    'Removed From Saved',
                                    style: TextStyle(
                                      color: beige,
                                    ),
                                  ),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            } else {
                              svaedProvider.add(loadedService.serviceId);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor:
                                      const Color.fromARGB(255, 76, 27, 75),
                                  content: Text(
                                    'Added To Saved',
                                    style: TextStyle(
                                      color: beige,
                                    ),
                                  ),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          icon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: 
                            svaedProvider.savedServices.contains(loadedService)?
                            Icon(Icons.bookmark, color: primary):
                            Icon(Icons.bookmark_border,color:primary)
                          ),
                          tooltip: 'Add to Saved',
                        )
                      ],
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(4.0),
                        child: Container(
                          height: 4.0,
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: ImageSliderScreen(imgList: loadedService.imgsUrl!),
                  ),
                  MyTabBar(tabController: _tabController),
                ];
              },
              body: MyTabBarView(
                tabController: _tabController,
                serviceId: widget.serviceId,
                description: loadedService.description,
                vendorname: loadedService.vendorName,
                serviceCategoryId: loadedService.categoryId,
              ),
            ),
          );
        },
      ),
    );
  }
}
