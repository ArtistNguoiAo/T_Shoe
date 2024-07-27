import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_view_state.dart';

class ListViewCubit extends Cubit<ListViewState> {
  ListViewCubit() : super(ListViewInitial());

  final List<String> listMonth = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];
  final List<String> listYear = ['2024', '2025'];

  Future<void> init() async {
    emit(ListViewLoaded(listMonth: listMonth, listYear: listYear));
  }
}
