class TFLiteService {
  Future<void> init() async {
    // No-op on web
  }

  Future<int> runInference(List<List<double>> grid) async {
    // Just return a dummy value on web
    return 0;
  }

  void close() {
    // No-op
  }
}
