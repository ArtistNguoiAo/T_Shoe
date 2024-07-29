part of 'shoe_create_cubit.dart';

@immutable
sealed class ShoeCreateState {}

final class ShoeCreateInitial extends ShoeCreateState {}

final class ShoeCreateLoading extends ShoeCreateState {}

final class ShoeCreateLoaded extends ShoeCreateState {
  final int listLength;

  ShoeCreateLoaded({required this.listLength});
}

final class ShoeCreateSuccess extends ShoeCreateState {
  final String message;

  ShoeCreateSuccess({required this.message});
}

final class ShoeCreateError extends ShoeCreateState {
  final String error;

  ShoeCreateError(this.error);
}