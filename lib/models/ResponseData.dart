class ResponseData {
  List<SearchResponse>? data;
  ResponseData({this.data});

  ResponseData.fromJson(Map<String, dynamic> json) {
    data = json['data'] == null ? null : (json["data"] as List).map((e) => SearchResponse.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
