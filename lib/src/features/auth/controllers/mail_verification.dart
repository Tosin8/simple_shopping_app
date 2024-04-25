import 'package:get/get.dart';
import 'package:simple_shopping_app/src/repository/auth/auth_repository.dart';

import '../../../utils/helper.dart';

class MailVerificationController extends GetxController {
  @override 
  void onInit() {
    super.onInit(); 
    sendVerificationEmail(); 
    setTimerForAutoRedirect(); 
  }

  Future<void> sendVerificationEmail() async {

    try {
await AuthenticationRepository.instance.sendEmailVerification(); 
    } catch(e) {
      Helpers.errorSnackBar(title: 'Oh Snap', message: e.toString()); 
    }

    await AuthenticationRepository.instance.sendEmailVerification(); 
  } 

  void setTimerForAutoRedirect(){} 

  void manuallyCheckEmailVerificationStatus(){}
}