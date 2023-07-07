class ExperienceModel {
  final String? position, company, description, startDate, endDate, image;

  ExperienceModel(
      {this.position,
      this.company,
      this.description,
      this.image,
      this.startDate,
      this.endDate});

  ExperienceModel copyWith({
    String? position,
    String? company,
    String? description,
    String? startDate,
    String? endDate,
    String? image,
  }) {
    return ExperienceModel(
      position: position ?? this.position,
      image: image ?? this.image,
      company: company ?? this.company,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
