import 'package:bloc/bloc.dart';
import 'package:e_medicine/core/enum/menu_type.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> init(MenuType menuType) async {
    emit(HomeMenuTypeState(menuType: menuType));
  }
}
