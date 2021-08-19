import 'package:streetview8x/models/hotspot_model.dart';
import 'package:streetview8x/models/panorama_model.dart';
import 'package:get/get.dart';
import 'package:wowit/Controller/baseController.dart';
import 'package:wowit/methods.dart';
import 'package:wowit/sqlService.dart';

class StreetViewController extends BaseController {
  Rx<PanoramaModel> panorama = Rx<PanoramaModel>();
  PanoramaModel get panoramaView => panorama.value;
  int idCurrentView = 1;

  void updateCurrentview(int newCurrent) async {
    idCurrentView = newCurrent;
    await loadData();
    update();
  }

  @override
  Future<Map<String, List<Map<String, Object>>>> loadData() async {
    print("Loaddata in controller Streetview id=" + idCurrentView.toString());

    Map<String, Object> jParam = {
      "@uidcreate": 1,
      "@idcurrent": idCurrentView,
    };
    var data = await SQLService.execute('sp_viewPanorama', params: jParam);
    panorama.value = getStreetview(data);
    return data;
  }

  PanoramaModel getStreetview(Map<String, List<Map<String, Object>>> data) {
    PanoramaModel retVal;
    List<HotspotModel> mapHotspots = [];
    for (var item in Methods.getList(data, 'tblHotspot')) {
      mapHotspots.add(HotspotModel(item));
    }
    Map<String, Object> rawPanorama = Methods.getList(data, 'tblPanorama')[0];
    retVal = PanoramaModel(rawPanorama, mapHotspots);

    print('$retVal');
    return retVal;
  }
}
