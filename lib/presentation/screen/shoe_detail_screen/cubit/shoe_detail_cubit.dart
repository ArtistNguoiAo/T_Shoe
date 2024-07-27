import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'shoe_detail_state.dart';

class ShoeDetailCubit extends Cubit<ShoeDetailState> {
  ShoeDetailCubit() : super(ShoeDetailInitial());
}
