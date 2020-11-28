import 'dart:convert'; // 8
import 'package:http/http.dart' as http; //1

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;
  Future getData() async {
    http.Response response = await http.get(url);
    // );

    print(response.body);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
