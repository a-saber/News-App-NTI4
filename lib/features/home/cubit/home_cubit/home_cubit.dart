import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti4_news/features/home/cubit/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void onIndexChanged(int newIndex){
    currentIndex = newIndex;
    emit(HomeSliderChangedState());
  }

}