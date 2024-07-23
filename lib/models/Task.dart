// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  final int id;
  final String name;
  final String description;
  final bool completed;
  final int queueId;

  Task({
    required this.id,
    required this.name,
    required this.description,
    required this.completed,
    required this.queueId,
  });

  Task copyWith({
    int? id,
    String? name,
    String? description,
    bool? completed,
    int? queueId,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      queueId: queueId ?? this.queueId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'completed': completed,
      'queueId': queueId,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      completed: map['completed'] as bool,
      queueId: map['queueId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(id: $id, name: $name, description: $description, completed: $completed, queueId: $queueId)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.completed == completed &&
      other.queueId == queueId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      completed.hashCode ^
      queueId.hashCode;
  }
}
