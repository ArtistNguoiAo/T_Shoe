part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeMenuTypeState extends HomeState {
  final MenuType menuType;

  HomeMenuTypeState({required this.menuType});
}




