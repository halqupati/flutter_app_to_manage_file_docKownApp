class Merchant {
  int? id;
  late final String name;
  late final String address;
  late final String city;

  Merchant(this.id,this.name, this.address, this.city);
  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      json['id'],
      json['name'],
      json['address'],
      json['city'],
    );
  }
}