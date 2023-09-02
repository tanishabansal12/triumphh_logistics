import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://triumphhlogistics-rds-instance-1.c9bkciincv3l.ap-southeast-2.rds.amazonaws.com'; // Replace with your server URL

  Future<void> saveDriverDetails(Map<String, dynamic> driverData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/driver'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(driverData),
    );

    if (response.statusCode == 201) {
      print('Driver details saved successfully');
    } else {
      print('Failed to save driver details');
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }
  }
}
