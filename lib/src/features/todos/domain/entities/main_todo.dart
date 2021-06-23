import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:todolist/src/features/todos/domain/entities/todo.dart';

class MainTodo extends Todo {
  final DateTime? date;
  final String? description;
  final List<Todo> subtasks;

  MainTodo({
    required String title,
    bool completed = false,
    this.date,
    this.description,
    this.subtasks = const <Todo>[],
  }) : super(title: title, completed: completed);


  MainTodo copyWith({
    String? title,
    bool? completed,
    DateTime? date,
    String? description,
    List<Todo>? subtasks,
  }) {
    return MainTodo(
      title: title ?? super.title,
      completed: completed ?? super.completed,
      date: date ?? this.date,
      description: description ?? this.description,
      subtasks: subtasks ?? this.subtasks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': super.title,
      'completed': super.completed,
      'date': date?.millisecondsSinceEpoch,
      'description': description,
      'subtasks': subtasks.map((x) => x.toMap()).toList(),
    };
  }

  factory MainTodo.fromMap(Map<String, dynamic> map) {
    return MainTodo(
      title: map['title'],
      completed: map['completed'],
      date: map['date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date']) : null,
      description: map['description'],
      subtasks: List<Todo>.from(map['subtasks']?.map((x) => Todo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MainTodo.fromJson(String source) => MainTodo.fromMap(json.decode(source));

  @override
  String toString() => 'MainTodo(title: ${super.title}, completed: ${super.completed} date: $date, description: $description, subtasks: $subtasks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MainTodo &&
      other.title == super.title &&
      other.completed == super.completed &&
      other.date == date &&
      other.description == description &&
      listEquals(other.subtasks, subtasks);
  }

  @override
  int get hashCode => title.hashCode ^ completed.hashCode ^ date.hashCode ^ description.hashCode ^ subtasks.hashCode; //TODO test if title and completed need to be called from super
}
