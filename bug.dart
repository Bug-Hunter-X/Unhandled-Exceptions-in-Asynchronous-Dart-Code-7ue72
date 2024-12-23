```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Use the data
    } else {
      // Handle error
      throw Exception('Failed to load data');
    }
  } catch (e) {
    // Handle exceptions, including network errors
    print('Error: $e');
    // Consider rethrowing or providing more specific error handling.
  }
}
```