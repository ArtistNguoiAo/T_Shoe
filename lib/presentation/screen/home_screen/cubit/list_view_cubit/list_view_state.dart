part of 'list_view_cubit.dart';

@immutable
sealed class ListViewState {}

final class ListViewInitial extends ListViewState {}

final class ListViewLoaded extends ListViewState {
  final List<String> listMonth;
  final List<String> listYear;

  ListViewLoaded({required this.listMonth, required this.listYear});
}