import 'dart:convert';
import 'package:api_calsses1/Model.dart';
import 'package:http/http.dart' as http;

class GetUserRepo {

  Future<UserModel> getUser({required int add_number}) async {

    String url = "https://randomuser.me/api/?results=$add_number";

    var response = await http.get(Uri.parse(url));

    print(response.body);
    print(response.statusCode);


    var data = jsonDecode(response.body);
    
    return UserModel.fromJson(data);
  }


}
