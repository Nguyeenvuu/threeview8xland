import 'package:flutter/material.dart';
import 'package:streetview8x/controllers/streetview_controller.dart';
import 'package:streetview8x/widgets/street_page.dart';
import 'package:wowit/Widget/baseWidgets.dart';

class Home extends StatelessWidget {
  final int idCurrentView;
  const Home({
    Key key,
    this.idCurrentView,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BaseWidget wListStreetView = StreetPage();
    StreetViewController streetViewController = wListStreetView.getController();
    // StreetViewController streetViewController = Get.find();
    print("Find controller streetview");
    streetViewController.idCurrentView = idCurrentView;
    return wListStreetView;
  }
}
