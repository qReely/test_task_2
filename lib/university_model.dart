class University {
  String country;
  String name;
  List<String> web_pages;
  String code;
  List<String> domains;

  University(
      {required this.country,
      required this.name,
      required this.web_pages,
      required this.code,
      required this.domains});

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
        country: json['country'],
        name: json['name'],
        web_pages: List<String>.from(json['web_pages']),
        code: json['alpha_two_code'],
        domains: List<String>.from(json['domains']));
  }

  Map<String, dynamic> toJson() => {
        "country": country,
        "name": name,
        "web_pages": web_pages,
        "code": code,
        "domains": domains
      };
}
