import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/bloc/todo_list/todo_list_bloc.dart';

part 'active_todo_count_event.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  TodoListBloc todoListCubit;

  final int initialActiveTodoCount;

  ActiveTodoCountBloc({
    required this.initialActiveTodoCount,
    required this.todoListCubit,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount)) {
    on<CalculateActiveTodoCountEvent>((CalculateActiveTodoCountEvent event,
        Emitter<ActiveTodoCountState> emit) {
      emit(state.copyWith(activeTodoCount: event.activeTodocount));
    });
  }
}
