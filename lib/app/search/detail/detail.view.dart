import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_kit/app/search/search.cubit.dart';
import 'package:starter_kit/app/search/search.view.dart';
import 'package:starter_kit/models/data_search/data_search.dart';

class DetailView extends StatefulWidget {
  final Items item;
  final SearchCubit cubit;

  const DetailView({required this.item, required this.cubit}) : super();

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Engineer Code Check", style: TextStyle(fontWeight: FontWeight.w600)),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.network(widget.item.owner!.avatarUrl!, width: 200),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                widget.item.fullName ?? "",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${widget.item.stargazersCount!.floor()} Stars", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("${widget.item.watchers!.floor()} Watchers", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("${widget.item.forks!.floor()} Forks", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text("${widget.item.openIssues!.floor()} Issue", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            BlocBuilder(
              bloc: widget.cubit,
              buildWhen: (previous, current) => current is LanguageLoading || current is LanguageLoaded,
              builder: (context, state) => state is LanguageLoaded ? _language() : SizedBox(),
            )
          ],
        ),
      ),
    );
  }

  Widget _language() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Language", style: TextStyle(fontSize: 20)),
          ...(widget.cubit.languages.data as Map<String, dynamic>)
              .entries
              .map((e) => Text("-   ${e.key}", style: TextStyle(fontSize: 18, color: Colors.blue)))
              .toList()
        ],
      ),
    );
  }
}
