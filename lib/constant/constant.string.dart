class ConstantString {
  ConstantString();

  static const String activity = 'Are you bored? Press next button to get random activity!';
  static String activityUpdate({required String name, required String price}) => 'You should do this activity $name because it cost like RM$price';
  static const String emptyHistory = 'The history is empty! Go fetch some activity and the data will appear here!';
  static const String history = 'HISTORY';
  static const String homes = 'HOMES';
  static const String next = 'NEXT';

  static const Map<String, String> dropdownChoices = {
    'none': '',
    'recreational': 'recreational',
    'education': 'education',
    'relaxation': 'relaxation',
    'social': 'social',
    'cooking': 'cooking',
  };

}