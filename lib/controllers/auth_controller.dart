import 'dart:convert';


import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/models/login_model.dart';
import 'package:top_star/models/user_model.dart';
import 'package:top_star/services/push_notification_helper.dart';


import '../../../services/toast_service.dart';
import '../core/app_widgets/custom_loading_widget.dart';
import '../repository/auth_repo.dart';
import '../router/route_helper.dart';

class AuthController extends GetxController with StateMixin {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  var slideTab = 0.obs;

  void onChangeSlide(int? value) {
    if (value != null) {

      slideTab.value = value;
    }
  }

  @override
  void onInit() {
    init();

    super.onInit();
  }

  Future<void> loadUserData() async {
    await authRepo.getUserData().then((value){
      UserData data=UserData.fromJson(json.decode(value));
      userData.value=data;
    });
  }

  final formKey = GlobalKey<FormState>();

  RxString appToken = "".obs;
  //* For Login ------------------------->
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  final TextEditingController forgotEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newConfirmPasswordController = TextEditingController();

  Rx<UserData> userData = UserData().obs;

  Future<void> login() async {
    var loading = BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) => const CustomLoadingWidget(),
    );
   // var fcmToken = await PushNotificationHelper.getDeviceTokenToSendNotification();
    var fcmToken="test";
    var body = {
      "emailOrPhone": loginEmailController.text,
      "password": loginPasswordController.text,
      "fcm_token_key": fcmToken
    };
    try {
      Response response = await authRepo.loginUser(body);
      if (response.statusCode == 200) {

        LoginModel authModel = LoginModel.fromJson(response.body);
        userData.value = authModel.data!;
        authRepo.saveUserData(userData: userData.value);
        appToken.value = authModel.token!;
       // authRepo.savePassword(password: loginPasswordController.text);
       // print("SavePassword");
        authRepo.saveAppToken(token: authModel.token!);
        authRepo.updateHeader(authModel.token!);
        loading();
        clearTextFields();
        init();
        loadUserData();
        ToastService.successToast("Login Success");
        Get.offNamed(RouteHelper.nav);
      } else {
        ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      loading();
    }
  }


  Future<void> logout() async {
    BotToast.showCustomLoading(
        toastBuilder: (_) => const CustomLoadingWidget());

    try {
      Response response = await authRepo.logoutUser();
      if (response.statusCode == 200) {
        authRepo.saveAppToken(token: "");
      //  authRepo.savePassword(password: "");
        appToken.value = "";
        userData.value = UserData();
        ToastService.successToast("Successfully Logout");
        BotToast.closeAllLoading();
        Get.offNamed(RouteHelper.login);
      } else {
        ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      BotToast.closeAllLoading();
    }
  }

  final TextEditingController regNameController = TextEditingController();
  final TextEditingController regEmailController = TextEditingController();
  final TextEditingController regPhoneController = TextEditingController();

  final TextEditingController regPasswordController = TextEditingController();
  final TextEditingController regConfirmPassController =
      TextEditingController();

  RxString passVal = "".obs;
  onChangePassField(val) {
    passVal.value = val;
  }


  Future<void> registerUser(BuildContext context) async {

    var loading = BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) => const CustomLoadingWidget(),
    );
    var fcmToken = await PushNotificationHelper.getDeviceTokenToSendNotification();
    var body = {
      "name": regNameController.text,
      "email": regEmailController.text,
      "phone": regPhoneController.text,
      "password": regPasswordController.text,
      "password_confirmation": regConfirmPassController.text,
      "fcm_token_key": fcmToken
    };

    try {
      Response response = await authRepo.registerUser(body);
      if (response.statusCode == 200) {
        await Future.delayed(const Duration(seconds: 2));
        LoginModel authModel = LoginModel.fromJson(response.body);
        userData.value = authModel.data!;
        authRepo.saveUserData(userData: userData.value);
        appToken.value = authModel.token!;

        authRepo.saveAppToken(token: authModel.token!);
        authRepo.updateHeader(authModel.token!);
        loading();
        clearTextFields();
        init();
        ToastService.successToast("Successfully Registered");
        Get.offNamed(RouteHelper.nav);
      } else {
        Get.snackbar("Error", response.body['message'],colorText: AppColor.primaryClr);
        //ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      return ToastService.errorToast(e.toString());
    } finally {
      loading();
    }
  }

  init() async {
    //notiInit();
    await getAppToken();
    //isSwitchedOn.value = await authRepo.getAppLanguage();
   // onChangeLanguage(isSwitchedOn.value);
    if (appToken.value.isNotEmpty) {
      loadUserData();
      await getUser(isInitial: true);

    }
  }


  Future<void> getUser({required bool isInitial}) async {
    try {authRepo.updateHeader(appToken.value);
    Response response = await authRepo.getUser();

    if (response.statusCode == 200) {
      UserModel data = UserModel.fromJson(response.body);
      userData.value = data.data!;

      print("Get_User>>>>"+"Success");
    } else if (response.statusCode == 401) {
      logout();
    } else {
      ToastService.errorToast(response.body['message']);
    }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      BotToast.closeAllLoading();
    }
  }
//* For Register ------------------------->



  //* For Logout ------------------------->



  //* Get User Data ------------------------->
  getAppToken() async {
    appToken.value = await authRepo.getAppToken();
  }

  //* Clear Data------------------------>
  clearTextFields() {
    loginEmailController.clear();
    loginPasswordController.clear();
    /*regNameController.clear();
    regEmailController.clear();
    regPasswordController.clear();
    regConfirmPassController.clear();*/
  }


  Future<void> forgotPassword(
      {required String? email}) async {
    BotToast.showCustomLoading(
        toastBuilder: (_) => const CustomLoadingWidget());
    FormData formData = FormData({
      "email": email,
    });
    try {
      Response response = await authRepo.forgotpassword(formData: formData);
      if (response.statusCode == 200) {
        ToastService.successToast(response.body['message']);
        Get.offNamed(RouteHelper.verifyOTP);
      } else {
        ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      BotToast.closeAllLoading();
    }
  }

  // ignore: non_constant_identifier_names
  Future<void> verify_forgotPassword(
      {required String? email,required String? code}) async {
    BotToast.showCustomLoading(
        toastBuilder: (_) => const CustomLoadingWidget());
    FormData formData = FormData({
      "email": email,
      "code": code,
    });
    try {
      Response response = await authRepo.verify_forgotpassword(formData: formData);
      if (response.statusCode == 200) {
        ToastService.successToast(response.body['message']);
        Get.offNamed(RouteHelper.updatePass);
      } else {
        ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      BotToast.closeAllLoading();
    }
  }


  // ignore: non_constant_identifier_names
  Future<void> update_password(
      // ignore: non_constant_identifier_names
      {required String? email,required String? password,required String? confirm_password}) async {
    BotToast.showCustomLoading(
        toastBuilder: (_) => const CustomLoadingWidget());
    FormData formData = FormData({
      "email": email,
      "password": password,
      "password_confirmation": confirm_password,
    });
    try {
      Response response = await authRepo.update_password(formData: formData);
      if (response.statusCode == 200) {
        ToastService.successToast(response.body['message']);
        Get.offAllNamed(RouteHelper.login);
      } else {
        ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      BotToast.closeAllLoading();
    }
  }

  Future<void> updateProfile(
      {required String? phone,
        required String? name,
        required String? email}) async {
    BotToast.showCustomLoading(
        toastBuilder: (_) => const CustomLoadingWidget());
   // String pass = await authRepo.getPassword();
    FormData formData = FormData({
      "name": name,
      "email": email,
      /*"profile_picture":
      img == null ? null : MultipartFile(img.path, filename: 'profile.png'),*/
      "phone": phone,

    });
    try {
      Response response = await authRepo.updateProfile(formData: formData);
      if (response.statusCode == 200) {
        ToastService.successToast("Successfully Updated");
        await getUser(isInitial: false);
        BotToast.closeAllLoading();
        Get.back();
      } else {
        ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      BotToast.closeAllLoading();
    }
  }


  Future<void> changePassword(
      {required String? oldPassword,
        required String? newPassword,
        required String? confirmPassword}) async {
    BotToast.showCustomLoading(
        toastBuilder: (_) => const CustomLoadingWidget());
    // String pass = await authRepo.getPassword();
    FormData formData = FormData({
      "old_password": oldPassword,
      "password": newPassword,
      "password_confirmation": confirmPassword,

    });
    try {
      Response response = await authRepo.changePassword(formData: formData);
      if (response.statusCode == 200) {
        ToastService.successToast("Successfully Updated");
       // await getUser(isInitial: false);
        BotToast.closeAllLoading();
        Get.back();
      } else {
        ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      BotToast.closeAllLoading();
    }
  }
  //* For Profile Card ------------------------->

  /*RxBool isObscure = true.obs;





  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    regNameController.dispose();
    regEmailController.dispose();
    regPasswordController.dispose();
    regConfirmPassController.dispose();
    super.onClose();
  }*/

  //* For Language ------------------------->
  /*RxBool isSwitchedOn = false.obs;

  onChangeLanguage(val) {
    isSwitchedOn.value = val;
    if (isSwitchedOn.value) {
      Get.updateLocale(const Locale('bu_mm'));
      authRepo.saveAppLanguage(val: isSwitchedOn.value);
    } else {
      Get.updateLocale(const Locale('en_us'));
      authRepo.saveAppLanguage(val: isSwitchedOn.value);
    }
  }

  onChangeLanguageValOnLogin(AppLanguage val) {
    if (val == AppLanguage.mm) {
      Get.updateLocale(const Locale('bu_mm'));
      authRepo.saveAppLanguage(val: true);
    } else {
      Get.updateLocale(const Locale('en_us'));
      authRepo.saveAppLanguage(val: false);
    }
  }*/

  //*For Update Profile ------------------------->

  /*

  Future<void> updatePassword(
      {required String newPass,
      required String newConfirmPass,
      required File? img,
      required String name,
      required String email}) async {
    BotToast.showCustomLoading(
        toastBuilder: (_) => const CustomLoadingWidget());
    String oldPass = await authRepo.getPassword();
    FormData formData = FormData({
      "name": name,
      "email": email,
      "profile_picture":
          img == null ? null : MultipartFile(img.path, filename: 'profile.png'),
      "old_password": oldPass,
      "password": newPass,
      "password_confirmation": newConfirmPass,
    });

    try {
      Response response = await authRepo.updateProfile(formData: formData);

      if (response.statusCode == 200) {
        ToastService.successToast("Successfully Updated");
        await Future.delayed(const Duration(milliseconds: 500));

        BotToast.closeAllLoading();
        logout();
      } else {
        ToastService.errorToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      BotToast.closeAllLoading();
    }
  }

  Future<void> deleteAccount() async {
    BotToast.showCustomLoading(
        toastBuilder: (_) => const CustomLoadingWidget());
    try {
      Response response = await authRepo.deleteAccoutn();
      if (response.statusCode == 200) {
        authRepo.saveAppToken(token: "");
        authRepo.savePassword(password: "");
        BotToast.closeAllLoading();
        Get.offAllNamed(RouteHelper.initial);
      } else {
        BotToast.closeAllLoading();
        ToastService.warningToast(response.body['message']);
      }
    } catch (e) {
      ToastService.errorToast(e.toString());
    } finally {
      BotToast.closeAllLoading();
    }
  }*/
}
