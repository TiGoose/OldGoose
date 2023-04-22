class SolutionResponse {
  String async = '';

  SolutionResponse({required this.async});

  SolutionResponse.fromJson(Map<String, dynamic> json) {
    async = json['async'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['async'] = this.async;
    return data;
  }
}