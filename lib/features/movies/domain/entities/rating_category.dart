class RatingCategory {
  const RatingCategory({required this.name, required this.rateValue});

  final String name;
  final double rateValue;
}

const ratings = <RatingCategory>[
  RatingCategory(name: 'All', rateValue: 2),
  RatingCategory(name: 'Bad', rateValue: 4),
  RatingCategory(name: 'Good', rateValue: 6),
  RatingCategory(name: 'Great', rateValue: 8),
  RatingCategory(name: 'Recommend', rateValue: 9),
];

extension RatingCategoryX on RatingCategory {
  bool isMatch(double vote) {
    if (name == 'All') return true;

    final index = ratings.indexOf(this);
    if (index == -1) return true;

    final min = (index == 1) ? 0.0 : rateValue;

    final max = (index < ratings.length - 1) ? ratings[index + 1].rateValue : 10.1;

    return vote >= min && vote < max;
  }
}
