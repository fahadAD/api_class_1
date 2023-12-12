import 'dart:convert';

import 'package:http/http.dart' as http;

import 'config.dart';
Future<bool> SignInRepo({required String passwords,required String emails}) async {

  String url = "${ConfigURL.mainUrl}/sign-in";
  // String url = "https://cashrockettest.acnoo.com/api/v1/sign-up";

  var response=await http.post(Uri.parse(url),body: {"email" :emails, "password":passwords,});

  print(response.statusCode);
  var resData=jsonDecode(response.body);

  print(resData['data']['token']);

  if(response.statusCode==200){
    return true;
  }else{
    return false;
  }



}
