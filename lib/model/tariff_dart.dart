


class Tariff {
  final String name;
  final String description;
  final int etaMinutes;
  final int price;

  const Tariff({
    required this.name,
    required this.description,
    required this.etaMinutes,
    required this.price,
  });

  /// 25000 -> "25,000 so'm"
  String get priceText {
    final digits = price.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
      buffer.write(digits[i]);
    }
    return "$buffer so'm";
  }
}

const tariffs = [
  Tariff(
    name: 'Standart',
    description: 'Hamyonbop va ishonchli kundalik sayohat',
    etaMinutes: 3,
    price: 25000,
  ),
  Tariff(
    name: 'Komfort',
    description: 'Kengroq va yuqori toifadagi mashinalar',
    etaMinutes: 2,
    price: 38000,
  ),
  Tariff(
    name: 'Mission',
    description: 'Maxsus VIP haydovchilar bilan hashamat',
    etaMinutes: 5,
    price: 42000,
  ),
];