import 'package:get/get.dart';

class MailVerificationController extends GetxController {
  @override 
  void onInit() {
    super.onInit(); 
    sendVerificationEmail(); 
  }

  void sendVerificationEmail(){} 

  void setTimerForAutoRedirect(){} 

  void manuallyCheckEmailVerificationStatus(){}
}