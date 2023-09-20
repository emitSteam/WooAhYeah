class Vaccin {
  final int group;
  final String name;
  final DateTime dueDate;
  final bool isComplete;
  final String guide;

  Vaccin({
    required this.group,
    required this.name,
    required this.dueDate,
    required this.isComplete,
    required this.guide,
  });

  Vaccin copyWith({
    int? group,
    String? name,
    DateTime? dueDate,
    bool? isComplete,
    String? guide,
  }) {
    return Vaccin(
      group: group ?? this.group,
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      isComplete: isComplete ?? this.isComplete,
      guide: guide ?? this.guide,
    );
  }
}
