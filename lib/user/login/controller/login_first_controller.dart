import 'package:get/get.dart';

class LoginFirstController extends GetxController{
  String _textFormFieldEmail = '';
  String _textFormFieldPwd = '';
  void emailController(emailResult) {

  }
  void pwdController(pwdResult){

  }
  void emailSavedController(emailSaved) {
    _textFormFieldEmail = emailSaved;
    update();

  }
  void pwdSavedController(pwdSaved) {
    _textFormFieldPwd = pwdSaved;
    update();

  }
}