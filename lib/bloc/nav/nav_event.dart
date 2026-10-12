
abstract class NavEvent {}

/// 0 = Bosh sahifa, 1 = Buyurtmalar, 2 = Aksiyalar, 3 = Profil
class NavTabChanged extends NavEvent {
  final int index;
  NavTabChanged(this.index);
}