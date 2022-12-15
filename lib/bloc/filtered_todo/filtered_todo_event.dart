// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filtered_todo_bloc.dart';

abstract class FilteredTodoEvent extends Equatable {
  const FilteredTodoEvent();

  @override
  List<Object> get props => [];
}

class SetFillteredTodoEvent extends FilteredTodoEvent {
  final List<Todo> todoList;
  final Filter filter;
  final String searchTerm;
  const SetFillteredTodoEvent({
    required this.todoList,
    required this.filter,
    required this.searchTerm,
  });

  @override
  String toString() =>
      'SetFillteredTodoEvent(todoList: $todoList, filter: $filter, searchTerm: $searchTerm)';

  @override
  List<Object> get props => [todoList, filter, searchTerm];
}
