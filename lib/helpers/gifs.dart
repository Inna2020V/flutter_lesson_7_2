import 'package:flutter_lesson_7_2/helpers/constants.dart';
import 'package:flutter_lesson_7_2/helpers/fetch.dart';

class GifsFetch {
  Future<dynamic> getGifs(String gif) async {
    FetchHelper fetchData = new FetchHelper(
        "$giphyURL?api_key=$giphyApiKey&q=$gif&limit=$numberOfGifs&offSet=0&rating=g");

    var decodedData = await fetchData.getData();
    return decodedData;
  }
}
