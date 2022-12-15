import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/todo_model.dart';

part 'filtered_todo_event.dart';
part 'filtered_todo_state.dart';

class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  final List<Todo> intialTodos;

  FilteredTodoBloc({
    required this.intialTodos,
  }) : super(FilteredTodoState(fillteredTodos: intialTodos)) {
    on<SetFillteredTodoEvent>((SetFillteredTodoEvent event, emit) {
      List<Todo> fillteredTodo = [];

      switch (event.filter) {
        case Filter.active:
          fillteredTodo =
              event.todoList.where((Todo t) => !t.completed).toList();
          break;
        case Filter.completed:
          fillteredTodo =
              event.todoList.where((Todo t) => t.completed).toList();
          break;
        case Filter.all:
        default:
          fillteredTodo = event.todoList;
          break;
      }

      if (event.searchTerm.isNotEmpty) {
        fillteredTodo = event.todoList
            .where((Todo t) =>
                t.desc.toLowerCase().contains(event.searchTerm.toLowerCase()))
            .toList();
      }

      emit(state.copyWith(fillteredTodos: fillteredTodo));
    });
  }
}
