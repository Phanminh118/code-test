part of 'search.cubit.dart';

@immutable
abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();

  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  const SearchLoading();

  @override
  List<Object> get props => [];
}

class LanguageLoading extends SearchState {
  const LanguageLoading();

  @override
  List<Object> get props => [];
}

class LanguageLoaded extends SearchState {
  final dynamic language;
  const LanguageLoaded(this.language);

  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final DataSearch data;

  const SearchLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class Signing extends SearchState {
  const Signing();

  @override
  List<Object> get props => [];
}

class Signed extends SearchState {
  const Signed();

  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object> get props => [message];
}
