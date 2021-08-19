import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panorama/panorama.dart';
import 'package:streetview8x/controllers/streetview_controller.dart';
import 'package:wowit/Controller/baseController.dart';
import 'package:wowit/Widget/baseWidgets.dart';

class StreetPage extends BaseWidget<StreetViewController> {
  StreetPage() : super(StreetViewController(), isComponent: false);

  @override
  Widget getMainView(
      BuildContext context,
      Map<String, List<Map<String, Object>>> data,
      BaseController baseController) {
    final StreetViewController streetviewController =
        baseController as StreetViewController;
    Widget panorama;
    panorama = Panorama(
      animSpeed: 0,
      interactive: true,
      child: Image.network(streetviewController.panoramaView.urlImage),
      hotspots: streetviewController.panoramaView.listHotspot
          .map((hotspot) => Hotspot(
                latitude: hotspot.latitude,
                longitude: hotspot.longitude,
                width: 90,
                height: 75,
                widget: hotspotButton(
                  text: "Next scene",
                  icon: Icons.open_in_browser,
                  onPressed: () {
                    streetviewController.updateCurrentview(hotspot.idNextView);
                    print(streetviewController.idCurrentView);
                  },
                ),
              ))
          .toList(),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          streetviewController.panoramaView.title,
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Stack(
        children: [panorama],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => streetviewController.updateCurrentview(1),
        child: Icon(Icons.home),
      ),
    );
  }

  Widget hotspotButton({String text, IconData icon, VoidCallback onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.black38),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Icon(icon),
          onPressed: onPressed,
        ),
        text != null
            ? Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Center(child: Text(text)),
              )
            : Container(),
      ],
    );
  }
}
