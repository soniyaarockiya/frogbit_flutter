import 'package:frogbitflutter/data/beer_pojo.dart';
import 'package:frogbitflutter/services/networking.dart';

class ApiService {
  Networking _networkCall = new Networking();
  List<Beer> beerList = [];
  String perPage = "10";

  Future<List<Beer>> getBeerData(String pageNumber) async {
    String url =
        "https://api.punkapi.com/v2/beers?page=$pageNumber&per_page=10";
    dynamic response = await _networkCall.getResponse(url);
    try {
      for (int i = 0; i <= 9; i++) {
        String itemId = response[i]["id"].toString();
        String beerName = response[i]["name"];
        String beerTagLine = response[i]["tagline"];
        String beerImageUrl = response[i]["image_url"];

        print(".......$itemId......$beerName");
        Beer beer = Beer(
            name: beerName,
            tagLine: beerTagLine,
            imageUrl: beerImageUrl,
            id: itemId);
        beerList.add(beer);
      }
    } catch (e) {
      print(e);
    }
    print(beerList.length);
    return beerList;
  }
}
