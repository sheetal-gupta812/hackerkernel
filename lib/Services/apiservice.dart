import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class BaseApiService {
  static var token = '';
  static var email = '';

  static Future<Response> post(url, body) async {
    final response = await https.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    return response;
  }
}
