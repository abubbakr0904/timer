import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../model/transfer_model.dart';
import '../my_responce.dart';
class ApiProvider {
  static Future<MyResponse> getTranfers() async{
    try {
      http.Response response = await http
          .get(Uri.parse("https://banking-api.free.mockoapp.net/transactions-incomes"));

      if (response.statusCode == HttpStatus.ok) {
        return MyResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => TransferModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return MyResponse(error: "Noma'lum xatolik");
    } catch (error) {
      return MyResponse(error: error.toString());
    }
  }
}