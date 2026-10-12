import 'package:yandex_map/core/format.dart';

enum OrderType { taxi, delivery }
enum OrderStatus { complate, delivered, cancelled }

class Order {
  final String day;
  final String title;
  final String subtitle;
  final int price;
  final OrderType type;
  final OrderStatus status;

  Order({
    required this.day,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.type,
    required this.status,
  });

  String get priceText => "${formatNumber(price)} so'm";
}

final sampleOrders = [
  Order(
    day: 'BUGUN',
    title: 'Yunusobod metro → Chorsu',
    subtitle: 'Bugun, 14:32 · Jasur T.',
    price: 25000,
    type: OrderType.taxi,
    status: OrderStatus.complate,
  ),
  Order(
    day: 'KECHA',
    title: 'Chilonzor → Olmazor',
    subtitle: 'Kecha, 18:15 · Bobur M.',
    price: 18000,
    type: OrderType.taxi,
    status: OrderStatus.complate,
  ),
  Order(
    day: 'KECHA',
    title: 'Baraka Restoran buyurtmasi',
    subtitle: 'Kecha, 19:40 · 3 mahsulot',
    price: 45000,
    type: OrderType.delivery,
    status: OrderStatus.delivered,
  ),
  Order(
    day: 'KECHA',
    title: 'Bekor qilingan',
    subtitle: 'Kecha, 21:10',
    price: 0,
    type: OrderType.taxi,
    status: OrderStatus.cancelled,
  ),
  Order(
    day: "O'TGAN HAFTA",
    title: 'Sergeli → Amir Temur xiyoboni',
    subtitle: 'Dushanba, 09:05 · Sardor K.',
    price: 32000,
    type: OrderType.taxi,
    status: OrderStatus.complate,
  ),
  Order(
    day: "O'TGAN HAFTA",
    title: 'Korzinka yetkazib berish',
    subtitle: 'Yakshanba, 12:20 · 7 mahsulot',
    price: 68000,
    type: OrderType.delivery,
    status: OrderStatus.delivered,
  ),
];

class Promotion {
  final String tag;
  final String deadline;
  final String title;
  final String description;
  final int current;
  final int total;
  final String unit;

  const Promotion({
    required this.tag,
    required this.deadline,
    required this.title,
    required this.description,
    required this.current,
    required this.total,
    required this.unit,
  });

  double get progress => current / total;
}

/// Namuna aksiyalar. Keyin serverdan keladi.
const samplePromotions = [
  Promotion(
    tag: 'Cashback',
    deadline: '31 martgacha',
    title: 'Har 5-safarda 5% cashback',
    description: "Taxi yoki yetkazish buyurtmalari uchun. Min: 10,000 so'm",
    current: 3,
    total: 5,
    unit: 'safar',
  ),
  Promotion(
    tag: 'Chegirma',
    deadline: '15 aprelgacha',
    title: 'Birinchi yetkazish bepul',
    description: "Istalgan restorandan 30,000 so'mdan yuqori buyurtmaga",
    current: 0,
    total: 1,
    unit: 'buyurtma',
  ),
  Promotion(
    tag: 'Bonus',
    deadline: '30 aprelgacha',
    title: "Do'stingizni taklif qiling",
    description: "Har bir taklif uchun 500 ball. Do'stingiz ham 500 ball oladi",
    current: 1,
    total: 3,
    unit: 'taklif',
  ),
  Promotion(
    tag: 'Cashback',
    deadline: '1 maygacha',
    title: 'Komfort tarifida 10% cashback',
    description: 'Komfort va Mission tariflaridagi har bir safar uchun',
    current: 2,
    total: 10,
    unit: 'safar',
  ),
];
