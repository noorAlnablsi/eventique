import 'package:eventique/core/widget/image_slider.dart';
import 'package:eventique/core/widget/my_bottom_appbar.dart';
import 'package:eventique/core/widget/my_tabBar.dart';
import 'package:eventique/core/widget/my_tabbarview.dart';
import 'package:eventique/providers/services_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceDetails extends StatefulWidget {
  const ServiceDetails({super.key, required this.serviceId});
  final int serviceId;

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
      Provider.of<AllServices>(context, listen: false).changeIndexforBottom(_tabController.index);
    
  }

  @override
  Widget build(BuildContext context) {
    final loadedService = Provider.of<AllServices>(context, listen: false).findById(widget.serviceId);
    
    return Scaffold(
      bottomNavigationBar: MyBottomAppBar(
        price: loadedService.price, 
        serviceId: loadedService.serviceId, 
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  loadedService.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontFamily: 'IrishGrover'),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(4.0),
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
            SliverToBoxAdapter(
              child: ImageSliderScreen(imgList: loadedService.imgsUrl!,),
            ),
            MyTabBar(tabController: _tabController),
          ];
        },
        body: MyTabBarView(
          tabController: _tabController,
          serviceId: widget.serviceId,
          description: loadedService.description,
          vendorname: loadedService.vendorName,
          serviceCategory:loadedService.category.name
        ),
      ),
    );
  }
}
