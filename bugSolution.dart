```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Result<Map<String, dynamic>>> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Result.success(jsonData);
    } else {
      return Result.failure('Failed to load data: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    return Result.failure('Invalid JSON format: $e');
  } on http.ClientException catch (e) {
    return Result.failure('Network error: $e');
  } catch (e) {
    return Result.failure('An unexpected error occurred: $e');
  }
}

class Result<T> {
  final T? data;
  final String? error;
  bool get isSuccess => error == null;

  Result.success(this.data) : error = null;
  Result.failure(this.error) : data = null;
}
```