import 'dart:convert';

import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String title;
  final bool completed;
  final DateTime modified;

  Todo({
    String? id,
    required this.title,
    this.completed = false,
    required this.modified,
  }) : this.id = id ?? UniqueKey().toString();

  Todo copyWith({
    String? title,
    bool? completed,
    DateTime? modified,
  }) {
    return Todo(
      id: this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      modified: modified ?? this.modified,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
      'modified': modified.millisecondsSinceEpoch,
    };
  }

  factory Todo.fromMap(Map<dynamic, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
      modified: DateTime.fromMillisecondsSinceEpoch(map['modified']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(id: $id, title: $title, completed: $completed, modified: $modified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.id == id &&
        other.title == title &&
        other.completed == completed &&
        other.modified == modified;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        completed.hashCode ^
        modified.hashCode;
  }
}
