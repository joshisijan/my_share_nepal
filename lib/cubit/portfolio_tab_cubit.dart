import 'package:bloc/bloc.dart';

class PortfolioTabCubit extends Cubit<int> {
  PortfolioTabCubit() : super(0);

  changeTab(int n) => emit(n);
}
