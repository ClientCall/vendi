import 'package:http/http.dart' show Client;
import '../models/store.dart';
import 'dart:convert';

const String URL_API = 'https://store-service-nameless.herokuapp.com';

class StoreService {
   Client client = Client();

  fetchStores() async {
    final response = await client.get('$URL_API/stores');
    if (response.statusCode == 200) {
      List responseJson = json.decode(response.body);
      List<Store> storeList = createUserList(responseJson);
      return storeList;
    }else{
      throw NullThrownError();
    }
  }

  List<Store> createUserList(List data){
    List<Store> list = new List();
    for (int i = 0; i < data.length; i++) {
      list.add(Store.fromJson(data[i]));
    }
    return list;
  }
}
