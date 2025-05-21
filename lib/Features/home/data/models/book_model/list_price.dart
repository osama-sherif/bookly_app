import 'package:equatable/equatable.dart';

class ListPrice extends Equatable {
  final dynamic? amount;
  final String? currencyCode;

  const ListPrice({this.amount, this.currencyCode});

  factory ListPrice.fromJson(Map<String, dynamic> json) => ListPrice(
    amount: json['amount'],
    currencyCode: json['currencyCode'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'amount': amount,
    'currencyCode': currencyCode,
  };

  @override
  List<Object?> get props => [amount, currencyCode];
}
