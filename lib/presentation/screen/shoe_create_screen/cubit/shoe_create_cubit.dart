import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shoe_create_state.dart';

class ShoeCreateCubit extends Cubit<ShoeCreateState> {
  ShoeCreateCubit() : super(ShoeCreateInitial());

  Future<void> init(int listLength) async {
    try {
      emit(ShoeCreateLoaded(listLength: listLength));
    } catch (e) {
      emit(ShoeCreateError(e.toString()));
    }
  }
}
