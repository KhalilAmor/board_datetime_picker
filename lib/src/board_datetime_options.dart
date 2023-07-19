import 'package:flutter/material.dart';

/// Class for defining options related to the UI used by [BoardDateTimeBuilder]
class BoardDateTimeOptions {
  BoardDateTimeOptions({
    this.backgroundColor,
    this.foregroundColor,
    this.textColor,
    this.activeColor,
    this.activeTextColor,
    this.backgroundDecoration,
    this.languages = const BoardPickerLanguages.en(),
    this.customOptions,
  });

  /// #### Picker Background Color
  /// default is `Theme.of(context).scaffoldBackgroundColor`
  final Color? backgroundColor;

  /// #### Picket Foreground Color
  /// default is `Theme.of(context).cardColor`
  final Color? foregroundColor;

  /// #### Picker Text Color
  /// default is `Theme.of(context).textTheme.bodyLarge?.color`
  final Color? textColor;

  /// #### Active Color
  /// Use the color of the currently selected date or button
  /// in the calendar as a color to indicate the selection status.
  /// If not specified, `Theme.of(context).primaryColor` color by default.
  final Color? activeColor;

  /// #### Active Text Color
  /// activeColor is used as the background color and activeTextColor as the text color.
  /// Default color is white.
  final Color? activeTextColor;

  /// BoxDecoration of the widget displayed on the backmost side of the picker.
  /// If not specified, it will be a standard BoxDecoration with
  /// the color specified in the normal backgroundColor (default).
  ///
  /// If both [backgroundColor] and backgroundColor are specified, this one takes precedence.
  final BoxDecoration? backgroundDecoration;

  /// Class for specifying language information to be used in the picker
  final BoardPickerLanguages languages;

  /// Option to specify items to be displayed in the picker by date and time.
  /// Only time can be specified.
  ///
  /// example:
  /// ```
  /// customOptions: BoardPickerCustomOptions.every15minutes(),
  /// ```
  /// Picker will show [0, 15, 30, 45].
  final BoardPickerCustomOptions? customOptions;
}

/// Class for specifying the language to be displayed
class BoardPickerLanguages {
  /// Day of the week to be displayed at the top of the calendar.
  /// Error if number of list items is other than 7.
  /// Default is ['SUN', 'MON', 'THU', 'WED', 'TUE', 'FRI', 'SAT'].
  final List<String> weekdays;

  /// Button text to move date to today.
  /// Default is [TODAY].
  final String today;

  /// Button text to move date to tomorrow.
  /// Default is [TOMORROW].
  final String tomorrow;

  /// Button text to move date/time to current time
  /// Default is [NOW].
  final String now;

  const BoardPickerLanguages({
    this.weekdays = _enWeekdays,
    this.today = _enToday,
    this.tomorrow = _enTomorrow,
    this.now = _enNow,
  }) : assert(weekdays.length == 7);

  /// Constructor in English notation
  const BoardPickerLanguages.en()
      : weekdays = _enWeekdays,
        today = _enToday,
        tomorrow = _enTomorrow,
        now = _enNow;

  /// Constructor in Japanese notation
  const BoardPickerLanguages.ja()
      : weekdays = const ['日', '月', '火', '水', '木', '金', '土'],
        today = '今日',
        tomorrow = '明日',
        now = '現在';

  static const _enWeekdays = ['SUN', 'MON', 'THU', 'WED', 'TUE', 'FRI', 'SAT'];
  static const _enToday = 'TODAY';
  static const _enTomorrow = 'TOMORROW';
  static const _enNow = 'NOW';
}

/// Class specifying custom items to be displayed in the picker.
/// (time only)
class BoardPickerCustomOptions {
  /// List to be displayed in the picker of the year.
  // final List<int> years;

  /// List to be displayed in the picker of the month.
  // final List<int> months;

  /// List to be displayed in the picker of the day.
  // final List<int> days;

  /// List to be displayed in the picker of the hour.
  final List<int> hours;

  /// List to be displayed in the picker of the minute.
  final List<int> minutes;

  BoardPickerCustomOptions({
    // this.years = const [],
    // this.months = const [],
    // this.days = const [],
    this.hours = const [],
    this.minutes = const [],
  });

  /// Picker display every 15 minutes
  factory BoardPickerCustomOptions.every15minutes() => BoardPickerCustomOptions(
        minutes: [0, 15, 30, 45],
      );
}
