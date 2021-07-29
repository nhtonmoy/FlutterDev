import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String url;

  NetworkHelper(this.url);

  Future getData() async {

    var url = Uri.parse(this.url);
    http.Response res = await http.get(url);

    if(res.statusCode == 200){
      String data = res.body;
      var decodedData = jsonDecode(data);
      return decodedData;
      // print(decodedData);
    }
    else {
      print(res.statusCode);
      return null;
    }
  }
}