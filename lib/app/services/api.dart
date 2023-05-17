import '../config/config.dart';

class ApiService {
  //auth
  static const login = "${AppConfig.baseUrl}action=login";
  static const register = "${AppConfig.baseUrl}register";

  //password
  static const resetPassword = "${AppConfig.baseUrl}register";

  //profile
  static const getProfile = "${AppConfig.baseUrl}getProfile";
  static const updateProfile = "${AppConfig.baseUrl}updateProfile";
  static const getAddress = "${AppConfig.baseUrl}getAddress";
  static const addAddress = "${AppConfig.baseUrl}getAddress";
  static const removeAddress = "${AppConfig.baseUrl}removeAddress";
  static const getAllOrders = "${AppConfig.baseUrl}getAllOrders";


  //home
  static const getFavourite = "${AppConfig.baseUrl}getFavourite";
  static const addFavourite = "${AppConfig.baseUrl}addFavourite";
  static const getNotification = "${AppConfig.baseUrl}notification";

  //cart
  static const getCartItems = "${AppConfig.baseUrl}getCartItems";
  static const addCartItems = "${AppConfig.baseUrl}addCartItems";
  static const removeCartItems = "${AppConfig.baseUrl}removeCartItems";

  //favourite
  static const removeFavourite = "${AppConfig.baseUrl}removeFavourite";

  //myorders
  static const getHistory = "${AppConfig.baseUrl}getHistory";
  static const cancelHistory = "${AppConfig.baseUrl}cancelHistory";
  static const deleteHistory = "${AppConfig.baseUrl}deleteHistory";



}
