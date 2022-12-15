import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/bloc/bloc.dart';

import '../model/todo_model.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Todo",
          style: TextStyle(fontSize: 40),
        ),
        BlocListener<TodoListBloc, TodoListState>(
          listener: ((context, state) {
            final count =
                state.todos.where((Todo t) => !t.completed).toList().length;
            context
                .read<ActiveTodoCountBloc>()
                .add(CalculateActiveTodoCountEvent(activeTodocount: count));
          }),
          child: BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
            builder: (context, state) {
              return Text("${state.activeTodoCount} items Left",
                  style:
                      const TextStyle(fontSize: 20, color: Colors.redAccent));
            },
          ),
        )
      ],
    );
  }
}
