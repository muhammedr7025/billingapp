import 'dart:convert';

class BillNumber {
  final String billNumber;
  BillNumber({
    required this.billNumber,
  });

  BillNumber copyWith({
    String? billNumber,
  }) {
    return BillNumber(
      billNumber: billNumber ?? this.billNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'billNumber': billNumber,
    };
  }

  factory BillNumber.fromMap(Map<String, dynamic> map) {
    return BillNumber(
      billNumber: map['billNumber'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BillNumber.fromJson(String source) =>
      BillNumber.fromMap(json.decode(source));

  @override
  String toString() => 'BillNumber(billNumber: $billNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BillNumber && other.billNumber == billNumber;
  }

  @override
  int get hashCode => billNumber.hashCode;
}
