import 'package:wowit/Model/baseModel.dart';
import 'package:wowit/methods.dart';

class HotspotModel extends BaseModel {
  int id;
  int idCurrentView;
  int idNextView;
  double longitude;
  double latitude;

  HotspotModel(Map<String, Object> data) : super(data) {
    id = Methods.getInt(data, 'ID');
    idCurrentView = Methods.getInt(data, 'IDCurrentView');
    idNextView = Methods.getInt(data, 'IDNextView');
    longitude = Methods.getDouble(data, 'longitude');
    latitude = Methods.getDouble(data, 'latitude');
  }
}
