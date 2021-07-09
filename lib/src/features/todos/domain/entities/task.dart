import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'todo.dart';

class Task extends Todo {
  final DateTime? date;
  final String? description;
  final List<Todo> subtasks;

  Task({
    required String title,
    bool completed = false,
    this.date,
    this.description,
    this.subtasks = const <Todo>[],
  }) : super(title: title, completed: completed);

  Task copyWith({
    String? title,
    bool? completed,
    DateTime? date,
    String? description,
    List<Todo>? subtasks,
  }) {
    return Task(
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

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      completed: map['completed'],
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      description: map['description'],
      subtasks: List<Todo>.from(map['subtasks']?.map((x) => Todo.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() =>
      'MainTodo(title: ${super.title}, completed: ${super.completed} date: $date, description: $description, subtasks: $subtasks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.title == super.title &&
        other.completed == super.completed &&
        other.date == date &&
        other.description == description &&
        listEquals(other.subtasks, subtasks);
  }

  @override
  int get hashCode =>
      super.title.hashCode ^
      super.completed.hashCode ^
      date.hashCode ^
      description.hashCode ^
      subtasks.hashCode;
}
