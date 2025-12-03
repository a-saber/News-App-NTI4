import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti4_news/features/home/cubit/home_cubit/home_state.dart';
import 'package:nti4_news/features/home/data/models/top_headlines_reponse.dart';
import 'package:nti4_news/features/home/data/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void onIndexChanged(int newIndex){
    currentIndex = newIndex;
    emit(HomeSliderChangedState());
  }
  NewsResponseModel? newsResponse;
  HomeRepo homeRepo = HomeRepo();
  void fetchTopHeadlines()async
  {
    emit(HomeTopHeadlinesLoadingState());
    var reponse = await homeRepo.fetchTopHeadlines();
    if(reponse == null){
      emit(HomeTopHeadlinesErrorState());
    }
    else{
      newsResponse = reponse;
      emit(HomeTopHeadlinesSuccessState());
    }

  }

}