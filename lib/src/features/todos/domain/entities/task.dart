import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Task {
  final String id;
  final String title;
  final bool completed;
  final DateTime modified;
  final DateTime? date;
  final String? description;
  final String? parentTask;
  final List<String> subtasks;
  Task({
    String? id,
    DateTime? modified,
    required this.title,
    this.completed = false,
    this.date,
    this.description,
    this.parentTask,
    this.subtasks = const <String>[],
  })  : this.id = id ?? UniqueKey().toString(),
        this.modified = modified ?? DateTime.now(),
        assert(
            parentTask == null || subtasks.isEmpty,
            'A subtask cannot contain other subtasks\n'
            'If parentTask != null, subtasks must be empty');

  Task copyWith({
    String? title,
    bool? completed,
    DateTime? modified,
    DateTime? date,
    String? description,
    String? parentTask,
    List<String>? subtasks,
  }) {
    return Task(
      id: this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      modified: modified ?? this.modified,
      date: date ?? this.date,
      description: description ?? this.description,
      parentTask: parentTask ?? this.parentTask,
      subtasks: subtasks ?? this.subtasks,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
      'modified': modified.millisecondsSinceEpoch,
      'date': date?.millisecondsSinceEpoch,
      'description': description,
      'parent_task': parentTask,
      'subtasks': subtasks,
    };
  }

  factory Task.fromMap(Map<dynamic, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
      modified: DateTime.fromMillisecondsSinceEpoch(map['modified']),
      date: map['date'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date'])
          : null,
      description: map['description'],
      parentTask: map['parent_task'],
      subtasks: List<String>.from(map['subtasks']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(id: $id, title: $title, completed: $completed, modified: $modified, date: $date, description: $description, parentTask: $parentTask, subtasks: $subtasks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.id == id &&
        other.title == title &&
        other.completed == completed &&
        other.modified == modified &&
        other.date == date &&
        other.description == description &&
        other.parentTask == parentTask &&
        listEquals(other.subtasks, subtasks);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        completed.hashCode ^
        modified.hashCode ^
        date.hashCode ^
        description.hashCode ^
        parentTask.hashCode ^
        subtasks.hashCode;
  }
}

// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'todo.dart';

// class Task extends Todo {
//   final DateTime? date;
//   final String? description;
//   final List<Todo> subtasks; //TODO use references to subtasks

//   Task({
//     String? id,
//     required String title,
//     required DateTime modified,
//     bool completed = false,
//     this.date,
//     this.description,
//     this.subtasks = const <Todo>[],
//   }) : super(title: title, completed: completed, modified: modified, id: id);

//   Task copyWith({
//     String? title,
//     bool? completed,
//     DateTime? modified,
//     DateTime? date,
//     String? description,
//     List<Todo>? subtasks,
//   }) {
//     return Task(
//       id: super.id,
//       title: title ?? super.title,
//       completed: completed ?? super.completed,
//       modified: modified ?? super.modified,
//       date: date ?? this.date,
//       description: description ?? this.description,
//       subtasks: subtasks ?? this.subtasks,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': super.id,
//       'title': super.title,
//       'completed': super.completed,
//       'modified': super.modified.millisecondsSinceEpoch,
//       'date': date?.millisecondsSinceEpoch,
//       'description': description,
//       'subtasks':
//           subtasks.isNotEmpty ? subtasks.map((x) => x.toMap()).toList() : null,
//     };
//   }

//   factory Task.fromMap(Map<dynamic, dynamic> map) {
//     return Task(
//       id: map['id'],
//       title: map['title'],
//       completed: map['completed'],
//       modified: DateTime.fromMillisecondsSinceEpoch(map['modified']),
//       date: map['date'] != null
//           ? DateTime.fromMillisecondsSinceEpoch(map['date'])
//           : null,
//       description: map['description'],
//       subtasks: map['subtasks'] != null
//           ? List<Todo>.from(map['subtasks']?.map((x) => Todo.fromMap(x)))
//           : [],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

//   @override
//   String toString() =>
//       'Task(id: ${super.id}, title: ${super.title}, completed: ${super.completed}, modified: ${super.modified}, date: $date, description: $description, subtasks: $subtasks)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Task &&
//         other.id == super.id &&
//         other.title == super.title &&
//         other.completed == super.completed &&
//         other.modified == super.modified &&
//         other.date == date &&
//         other.description == description &&
//         listEquals(other.subtasks, subtasks);
//   }

//   @override
//   int get hashCode =>
//       super.hashCode ^ date.hashCode ^ description.hashCode ^ subtasks.hashCode;
// }
