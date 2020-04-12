class Champions {
  String type;
  String format;
  String version;

  Champions({this.type, this.format, this.version});

  Champions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    format = json['format'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['format'] = this.format;
    data['version'] = this.version;
    return data;
  }
}