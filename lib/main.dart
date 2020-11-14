import 'package:flutter/material.dart';
import 'package:flutter_app_mvvm/ViewModel/PostViewModel.dart';
import 'package:flutter_app_mvvm/Model/Post.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Fetch Data Example'),
          ),
          body: ListContainer())));
}

class ListContainer extends StatefulWidget {
  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: ListWidget()));
  }
}

class ListWidget extends StatelessWidget {

  final PostViewModel viewModel = PostViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: this.viewModel.fetchPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${snapshot.data[index].title}'),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // 기본적으로 로딩 Spinner를 보여줍니다.
        return CircularProgressIndicator();
      },
    );
  }
}
