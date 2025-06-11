import 'dart:convert';
import 'package:http/http.dart' as http;

class TFLiteService {
  Future<void> init() async {
    // No init needed for web API
  }

  Future<int> runInference(List<List<double>> grid) async {
    final uri = Uri.parse('http://localhost:5001/predict');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'grid': grid}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['prediction'];
    } else {
      throw Exception('Failed to get prediction');
    }
  }

  void close() {
    // Nothing to close
  }
}
