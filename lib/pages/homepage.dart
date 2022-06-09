import 'package:flutter/material.dart';
import 'package:globenews/component/listtile.dart';
import 'package:globenews/model/article.model.dart';
import 'package:globenews/service/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("G-News", style: TextStyle(color: Colors.black, fontSize: 20),),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: FutureBuilder(
          future: client.getArticle(),
          builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
            if(snapshot.hasData){
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (context, index) => CustomListTile(articles[index], context)
              );
        }
            return Center(
            child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
