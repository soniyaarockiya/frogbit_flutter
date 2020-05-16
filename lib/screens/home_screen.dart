import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frogbitflutter/data/beer_pojo.dart';
import 'package:frogbitflutter/services/api_data.dart';
import 'package:frogbitflutter/services/provider_package_state_management.dart';
import 'package:frogbitflutter/subwidgets/list_view_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Constants
  ApiService _apiService = new ApiService();
  List<Beer> beerList = [];
  ScrollController _scrollController = ScrollController();
  int pageNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBeerData();

    //if user reaches end of the scrollview then new data will be fetched
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          //url uses page number as a value
          pageNumber += 1;
          getBeerData();
        });
      }
    });
  }

  void getBeerData() async {
    dynamic beerDetails = await _apiService.getBeerData(pageNumber.toString());
    setState(() {
      beerList = beerDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    String userId = Provider.of<UserDataProvider>(context).userId;
    print(userId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home'),
      ),
      body: ListView.builder(
          controller: _scrollController,
          //index overflow for cupertino indicator to work
          itemCount: beerList.length + 1,
          itemBuilder: (context, int index) {
            if (index == beerList.length) {
              return CupertinoActivityIndicator(
                radius: 40.0,
              );
            }
            return ListCard(
              name: beerList[index].name,
              tagLine: beerList[index].tagLine,
              imageUrl: beerList[index].imageUrl,
              id: beerList[index].id,
            );
          }),
    );
  }
}
