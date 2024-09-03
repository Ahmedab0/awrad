
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {

  bool hasPermission = false;

  Future getPermission() async {
    if(await Permission.location.serviceStatus.isEnabled) {
      var status  = await Permission.location.status;
      if(status.isGranted){
        hasPermission = true;
      } else {
        Permission.location.request().then((value){
          hasPermission = (value == PermissionStatus.granted);
        });
      }
      print('Permission called => Permission');
    }
  }

}