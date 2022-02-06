import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:starter_kit/app/app.module.dart';
import 'package:starter_kit/app/components/common-button/common-button.component.dart';
import 'package:starter_kit/app/components/text-field/text-field.component.dart';
import 'package:starter_kit/app/search/detail/detail.view.dart';
import 'package:starter_kit/app/search/search.cubit.dart';
import 'package:starter_kit/config/application.dart';
import 'package:starter_kit/config/config_screen.dart';
import 'package:starter_kit/models/data_search/data_search.dart';
import 'package:starter_kit/resources/default.i18n.dart';
import 'package:starter_kit/services/search/search.service.dart';
import 'package:starter_kit/themes/style.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<Search> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  SearchCubit _cubit = SearchCubit(SearchService());
  TextEditingController _controller = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text("Flutter Engineer Code Check", style: TextStyle(fontWeight: FontWeight.w600)),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _searchBox(),
            Expanded(
                child: BlocBuilder(
                    bloc: _cubit,
                    buildWhen: (previous, current) => current is SearchLoaded || current is SearchLoading,
                    builder: (context, state) => state is SearchLoaded ? _list() : SizedBox()))
          ],
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Icon(Icons.search, size: 30, color: Colors.grey),
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(fontSize: 18, color: Colors.black),
              cursorColor: Colors.grey,
              controller: _controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search.........",
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              ),
              onChanged: (value) {
                _debouncer.run(() {
                  if (value != "") {
                    _cubit.search(value.toString());
                  } else {
                    _cubit.data.items!.clear();
                    setState(() {});
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _list() {
    return ListView.separated(
      itemBuilder: (context, index) => _item(_cubit.data.items![index]),
      separatorBuilder: (context, index) => Divider(color: Color(0xFFE2E2E2), thickness: 0),
      itemCount: _cubit.data.items!.length,
    );
  }

  Widget _item(Items item) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _cubit.language(item.languagesUrl!);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailView(item: item, cubit: _cubit)),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(item.fullName ?? "", style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
    );
  }
}

class Debouncer {
  final int? milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({this.milliseconds});

  // ignore: always_declare_return_types
  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds!), action);
  }
}
