import 'dart:convert';
import 'package:crypto_app/model/crypto_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List<CryptoModel> data=[];
  Future<List<CryptoModel>> getCryptoData() async {
    String url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order="
        "market_cap_desc&per_page=100&page=1&sparkline=false";
    http.Response response =await http.get(Uri.parse(url));
    var jsonData= jsonDecode(response.body);
    if(response.statusCode==200){
      for(Map<String,dynamic> i in jsonData){
        data.add(CryptoModel.fromJson(i));
      }
      return data;
    }else{
      return data;
    }
  }
}
