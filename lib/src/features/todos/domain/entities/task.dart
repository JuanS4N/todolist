import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'todo.dart';

class Task extends Todo {
  final DateTime? date;
  final String? description;
  final List<Todo> subtasks;

  Task({
    String? id,
    required String title,
    required DateTime modified,
    bool completed = false,
    this.date,
    this.description,
    this.subtasks = const <Todo>[],
  }) : super(title: title, completed: completed, modified: modified, id: id);

  Task copyWith({
    String? title,
    bool? completed,
    DateTime? modified,
    DateTime? date,
    String? description,
    List<Todo>? subtasks,
  }) {
    return Task(
      title: title ?? super.title,
      completed: completed ?? super.completed,
      modified: modified ?? super.modified,
      date: date ?? this.date,
      description: description ?? this.description,
      subtasks: subtasks ?? this.subtasks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': super.id,
      'title': super.title,
      'completed': super.completed,
      'modified': super.modified,
      'date': date?.millisecondsSinceEpoch,
      'description': description,
      'subtasks':
          subtasks.isNotEmpty ? subtasks.map((x) => x.toMap()).toList() : null,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
      modified: DateTime.fromMillisecondsSinceEpoch(map['modified']),
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
      'Task(id: ${super.id}, title: ${super.title}, completed: ${super.completed}, modified: ${super.modified}, date: $date, description: $description, subtasks: $subtasks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.id == super.id &&
        other.title == super.title &&
        other.completed == super.completed &&
        other.modified == super.modified &&
        other.date == date &&
        other.description == description &&
        listEquals(other.subtasks, subtasks);
  }

  @override
  int get hashCode =>
      super.hashCode ^ date.hashCode ^ description.hashCode ^ subtasks.hashCode;
}
