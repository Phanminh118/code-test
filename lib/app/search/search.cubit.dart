import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_kit/config/application.dart';
import 'package:starter_kit/models/data_search/data_search.dart';
import 'package:starter_kit/services/search/search.service.dart';
import 'package:starter_kit/utils/exception.dart';

part 'search.state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchService _searchService;

  SearchCubit(this._searchService) : super(SearchInitial()) {}

  DataSearch data = DataSearch();

  Future<void> search(String word) async {
    try {
      emit(SearchLoading());
      data = await _searchService.search(word);
      // print(data.items!.map((e) => e.toJson()).toList());
      emit(SearchLoaded(data));
    } on NetworkException {
      Application.toast.showToastNotification("Error");
    }
  }

  var languages;

  Future<void> language(String url) async {
    try {
      emit(LanguageLoading());
      languages = await Application.api.dio.get(url);
      print(languages);
      emit(LanguageLoaded(language));
    } on NetworkException {
      Application.toast.showToastNotification("Error");
    }
  }
}
