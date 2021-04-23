import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_networking/newsArticle.dart';
import 'package:flutter_networking/webservice.dart';
import 'package:flutter_networking/constants.dart';

class NewsListState extends State<NewsList> {

  List<NewsArticle> _newsArticles = [];

  @override
  void initState() {
    super.initState();
    _populateNewsArticles();
  }

  void _populateNewsArticles() {
    Webservice().load(NewsArticle.all).then((newsArticles) => {
      setState(() => {
        _newsArticles = newsArticles
      })
    });
  }

  ListTile _buildItemsForListView(BuildContext context, int index) {
    return ListTile(
      title: _newsArticles[index].urlToImage == null ? Image.asset(Constants.newsImage) : Image.network(_newsArticles[index].urlToImage),
      subtitle: Text(_newsArticles[index].title, style: TextStyle(fontSize: 18)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: ListView.builder(
          itemCount: _newsArticles.length,
          itemBuilder: _buildItemsForListView,
        )
    );
  }
}

class NewsList extends StatefulWidget {

  @override
  createState() => NewsListState();
}