import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

abstract class SocialLogin{
  Future<bool> login();
  Future<bool> logout();
}
class KakaoLogin implements SocialLogin{
  @override
  Future<bool> login() async {
   try {
     bool isInstalled = await isKakaoTalkInstalled();
     if(isInstalled) {
       try {
         await UserApi.instance.loginWithKakaoTalk();
         return true;
       } catch (e) {
         return false;
       }
     }else {
       try {
         await UserApi.instance.loginWithKakaoTalk();
         return true;
       }catch(e){
         return false;
       }
     }
   } catch (error) {
      return false;
   }
  }

  @override
  Future<bool> logout() async{
  try{
    await UserApi.instance.unlink();
    return true;
  }catch(e){
    return false;
  }
  }

}
