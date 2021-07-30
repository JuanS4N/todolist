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
  final String listId;
  Task({
    String? id,
    DateTime? modified,
    required this.title,
    required this.listId,
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
    String? listId,
    bool removeParent = false,
  }) {
    return Task(
      id: this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      modified: modified ?? this.modified,
      date: date ?? this.date,
      description: description ?? this.description,
      parentTask: removeParent ? null : parentTask ?? this.parentTask,
      subtasks: subtasks ?? this.subtasks,
      listId: listId ?? this.listId,
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
      'list_id': listId,
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
      listId: map['list_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(id: $id, title: $title, completed: $completed, modified: $modified, date: $date, description: $description, parentTask: $parentTask, subtasks: $subtasks, listId: $listId)';
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
        other.listId == listId &&
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
        listId.hashCode ^
        subtasks.hashCode;
  }
}
