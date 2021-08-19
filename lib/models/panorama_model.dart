import 'package:streetview8x/models/hotspot_model.dart';
import 'package:wowit/Model/baseModel.dart';
import 'package:wowit/methods.dart';

class PanoramaModel extends BaseModel {
  int id;
  int uidCreate;
  int isRoot;
  String title;
  String urlImage;
  List<HotspotModel> listHotspot;
  PanoramaModel(Map<String, Object> data, List<HotspotModel> list)
      : super(data) {
    id = Methods.getInt(data, 'ID');
    uidCreate = Methods.getInt(data, 'uidCreate');
    isRoot = Methods.getInt(data, 'isRoot');
    title = Methods.getString(data, 'title');
    urlImage = Methods.getString(data, 'hinhAnh_image_view');
    listHotspot = list;
  }
}
