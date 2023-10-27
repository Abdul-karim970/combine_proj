part of 'fetch_item_bloc.dart';

@immutable
sealed class FetchItemState {}

final class FetchItemInitialState extends FetchItemState {
  final String initialText;
  FetchItemInitialState({required this.initialText});
}

final class FetchItemLoadingState extends FetchItemState {}

final class FetchItemLoadedState extends FetchItemState {
  final List<ItemModel> items;
  FetchItemLoadedState({required this.items});
}

final class FetchItemErrorState extends FetchItemState {
  final String error;
  FetchItemErrorState({required this.error});
}
