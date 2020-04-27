import 'package:equatable/equatable.dart';

class Exchange extends Equatable {
  final List<Rate> rates;
  final String base;
  final DateTime date;

  const Exchange({
    this.rates,
    this.base,
    this.date,
  });

  factory Exchange.fromJson(Map<String, dynamic> json) {
    return Exchange(
      rates: [
        for (final rate in (json['rates'] as Map).keys)
          Rate.fromJson({
            'code': rate,
            'value': json['rates'][rate],
          }),
      ]..sort((b, a) => b.code.compareTo(a.code)),
      base: json['base'],
      date: DateTime.parse(json['date']),
    );
  }

  @override
  List<Object> get props => [rates, date];
}

class Rate extends Equatable {
  final String code;
  final double value;

  const Rate({
    this.code,
    this.value,
  });

  factory Rate.fromJson(Map<String, dynamic> json) {
    return Rate(
      code: json['code'],
      value: json['value'],
    );
  }

  @override
  List<Object> get props => [code, value];
}
