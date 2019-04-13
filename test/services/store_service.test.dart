import 'dart:convert';

import 'package:vendi/models/store.dart';
import 'package:vendi/services/store.service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
// import 'package:test/test.dart';

Store store1 = Store(
  id:1,
  name:"La tienda de Jairo",
  description:null,
  user:null,
  createdAt:"2019-04-09T01:54:41.636Z",
  updateAt:"2019-04-09T01:54:41.636Z");
Store store2 = Store(
  id:2,
  name:"La tienda de Andrés",
  description:null,
  user:null,
  createdAt:"2019-04-09T01:55:16.062Z",
  updateAt:"2019-04-09T01:55:16.062Z");
Store store3 = Store(
  id:3,
  name:"La tienda de Mathi",
  description:"Esta es una tienda super pro!",
  user:"mathi",
  createdAt:"2019-04-09T03:23:43.723Z",
  updateAt:"2019-04-09T03:23:43.723Z");
Store store4 = Store(
  id:4,
  name:"La tienda de Mathi",
  description:"Esta es una tienda super pro!",
  user:"mathi",
  createdAt:"2019-04-09T13:25:58.059Z",
  updateAt:"2019-04-09T13:25:58.059Z");
List<Store> stores = [ store1, store2, store3, store4 ];

class MockClient extends Mock implements StoreService {
}

void main(){
  test("Calling all stores", () async {
    final apiProvider = MockClient();
    when(apiProvider.fetchStores()).thenReturn(stores);
    final _data = await apiProvider.fetchStores();
    expect(_data, stores);
  });

  test('create user list from json', (){
    String data = '[{"id":1,"name":"La tienda de Jairo","description":null,"user":null,"created_at":"2019-04-09T01:54:41.636Z","updated_at":"2019-04-09T01:54:41.636Z"},{"id":2,"name":"La tienda de Andrés","description":null,"user":null,"created_at":"2019-04-09T01:55:16.062Z","updated_at":"2019-04-09T01:55:16.062Z"},{"id":3,"name":"La tienda de Mathi","description":"Esta es una tienda super pro!","user":"mathi","created_at":"2019-04-09T03:23:43.723Z","updated_at":"2019-04-09T03:23:43.723Z"},{"id":4,"name":"La tienda de Mathi","description":"Esta es una tienda super pro!","user":"mathi","created_at":"2019-04-09T13:25:58.059Z","updated_at":"2019-04-09T13:25:58.059Z"}]';
    final apiProvider = StoreService();
    List responseJson = json.decode(data);
    List<Store> storeList = apiProvider.createUserList(responseJson);

    expect(storeList[0].id, stores[0].id);
    expect(storeList[0].name, stores[0].name);
    expect(storeList[0].description, stores[0].description);
    expect(storeList[0].user, stores[0].user);
  });
}