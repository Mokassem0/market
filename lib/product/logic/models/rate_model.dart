class RateModel {
  String? id;
  DateTime? createdAt;
  int? rates;
  String? forUser;
  String? forProduct;

  RateModel({
    this.id,
    this.createdAt,
    this.rates,
    this.forUser,
    this.forProduct,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
    id: json['id'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    rates: json['rates'] as int?,
    forUser: json['for_user'] as String?,
    forProduct: json['for_product'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt?.toIso8601String(),
    'rates': rates,
    'for_user': forUser,
    'for_product': forProduct,
  };
}
