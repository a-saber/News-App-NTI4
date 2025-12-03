import 'package:dio/dio.dart';
import 'package:nti4_news/features/home/data/models/top_headlines_reponse.dart';

class HomeRepo {

  Dio dio = Dio();
  
  Future<NewsResponseModel?> fetchTopHeadlines() async{
    try{  
      var response = await dio.get(
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        'apiKey': '836086f05b344448a16dd41ee51c6320',
        'q': 'we'
      }
    ); 
    return NewsResponseModel.fromJson(response.data as Map<String, dynamic>);
    }
    catch(e){
      if(e is DioException){
        print('Dio error occurred: ${e.response.toString()}');
      }
      print('Error occurred: $e');
      return null;
    }
  }
}
