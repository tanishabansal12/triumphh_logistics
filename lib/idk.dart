import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final response = await http.get(Uri.parse('http://triumphhlogistics-rds-instance-1.c9bkciincv3l.ap-southeast-2.rds.amazonaws.com/testtable'));

  if (response.statusCode == 200) {
    final List<dynamic> rows = json.decode(response.body);
    print('Rows from testtable:');
    for (var row in rows) {
      print(row);
    }
  } else {
    print('Failed to fetch rows from testtable');
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
  }
}
