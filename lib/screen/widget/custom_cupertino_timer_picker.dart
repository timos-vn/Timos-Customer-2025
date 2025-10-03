// Values derived from https://developer.apple.com/design/resources/ and on iOS
// simulators with "Debug View Hierarchy".
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kItemExtent = 32.0;
// From the picker's intrinsic content size constraint.
const double _kPickerWidth = 320.0;
const double _kPickerHeight = 216.0;
// The density of a date picker is different from a generic picker.
// Eyeballed from iOS.
const double _kSqueeze = 1.25;
// Considers setting the default background color from the theme, in the future.
const Color _kBackgroundColor = CupertinoColors.white;
// Half of the horizontal padding value between the timer picker's columns.
const double _kTimerPickerHalfColumnPadding = 2;
// The horizontal padding between the timer picker's number label and its
// corresponding unit label.
const double _kTimerPickerLabelPadSize = 4.5;
const double _kTimerPickerLabelFontSize = 17.0;

// The width of each colmn of the countdown time picker.
const double _kTimerPickerColumnIntrinsicWidth = 106;
// Unfortunately turning on magnification for the timer picker messes up the label
// alignment. So we'll have to hard code the font size and turn magnification off
// for now.
const double _kTimerPickerNumberLabelFontSize = 23;
// fix ###############
const TimeOfDay _startRestriction = TimeOfDay(hour: 0, minute: 0);
const TimeOfDay _endRestriction = TimeOfDay(hour: 23, minute: 59);

// ####################
class CustomCupertinoTimerPicker extends StatefulWidget {
  /// Constructs an iOS style countdown timer picker.
  ///
  /// [mode] is one of the modes listed in [CupertinoTimerPickerMode] and
  /// defaults to [CupertinoTimerPickerMode.hms].
  ///
  /// [onTimerDurationChanged] is the callback called when the selected duration
  /// changes and must not be null.
  ///
  /// [initialTimerDuration] defaults to 0 second and is limited from 0 second
  /// to 23 hours 59 minutes 59 seconds.
  ///
  /// [minuteInterval] is the granularity of the minute spinner. Must be a
  /// positive integer factor of 60.
  ///
  /// [secondInterval] is the granularity of the second spinner. Must be a
  /// positive integer factor of 60.
  // fix ###############
  final TimeOfDay startRestriction;
  final TimeOfDay endRestriction;
  // ####################
  CustomCupertinoTimerPicker({
    Key? key,
    this.mode = CupertinoTimerPickerMode.hms,
    this.initialTimerDuration = Duration.zero,
    this.minuteInterval = 1,
    this.secondInterval = 1,
    this.alignment = Alignment.center,
    this.backgroundColor = _kBackgroundColor,
    // fix ###############
    this.startRestriction = _startRestriction,
    this.endRestriction = _endRestriction,
    // ####################
    required this.onTimerDurationChanged,
  })  : assert(mode != null),
        assert(onTimerDurationChanged != null),
        assert(initialTimerDuration >= Duration.zero),
        assert(initialTimerDuration < const Duration(days: 1)),
        assert(minuteInterval > 0 && 60 % minuteInterval == 0),
        assert(secondInterval > 0 && 60 % secondInterval == 0),
        assert(initialTimerDuration.inMinutes % minuteInterval == 0),
        assert(initialTimerDuration.inSeconds % secondInterval == 0),
        assert(backgroundColor != null),
        assert(alignment != null),
        super(key: key);

  /// The mode of the timer picker.
  final CupertinoTimerPickerMode mode;

  /// The initial duration of the countdown timer.
  final Duration initialTimerDuration;

  /// The granularity of the minute spinner. Must be a positive integer factor
  /// of 60.
  final int minuteInterval;

  /// The granularity of the second spinner. Must be a positive integer factor
  /// of 60.
  final int secondInterval;

  /// Callback called when the timer duration changes.
  final ValueChanged<Duration> onTimerDurationChanged;

  /// Defines how the timer picker should be positioned within its parent.
  ///
  /// This property must not be null. It defaults to [Alignment.center].
  final AlignmentGeometry alignment;

  /// Background color of timer picker.
  ///
  /// Defaults to [CupertinoColors.white] when null.
  final Color backgroundColor;

  @override
  State<StatefulWidget> createState() => _CustomCupertinoTimerPickerState();
}

class _CustomCupertinoTimerPickerState
    extends State<CustomCupertinoTimerPicker> {
  late TextDirection textDirection;
  late CupertinoLocalizations localizations;
  int get textDirectionFactor {
    switch (textDirection) {
      case TextDirection.ltr:
        return 1;
      case TextDirection.rtl:
        return -1;
    }
    return 1;
  }

  // The currently selected values of the picker.
  int selectedHour = 0;
  int selectedMinute = 0;
  int selectedSecond = 0;

  // On iOS the selected values won't be reported until the scrolling fully stops.
  // The values below are the latest selected values when the picker comes to a full stop.
  int lastSelectedHour = 0;
  int lastSelectedMinute = -1;
  int lastSelectedSecond = -1;

  final TextPainter textPainter = TextPainter();
  final List<String> numbers = List<String>.generate(10, (int i) => '${9 - i}');
  double numberLabelWidth = 0;
  double numberLabelHeight = 0;
  double numberLabelBaseline = 0;
  // fix ###############
  int startRestrictionMinute = 0;
  int endRestrictionMinute = 60;
  // ####################
  @override
  void initState() {
    super.initState();
    selectedMinute = widget.initialTimerDuration.inMinutes % 60;
    print("selectedMinute");
    print(selectedMinute);
    if (widget.mode != CupertinoTimerPickerMode.ms) {
      selectedHour = widget.initialTimerDuration.inHours;
      _changeRestrictionMinute();
    }

    if (widget.mode != CupertinoTimerPickerMode.hm)
      selectedSecond = widget.initialTimerDuration.inSeconds % 60;

    PaintingBinding.instance.systemFonts.addListener(_handleSystemFontsChange);
  }

  void _handleSystemFontsChange() {
    setState(() {
      // System fonts change might cause the text layout width to change.
      textPainter.markNeedsLayout();
      _measureLabelMetrics();
    });
  }

  void _changeRestrictionMinute() {
    setState(() {
      if (selectedHour == widget.endRestriction.hour) {
        endRestrictionMinute = widget.endRestriction.minute;
      } else {
        endRestrictionMinute = 60;
      }
      if (selectedHour == widget.startRestriction.hour) {
        print(widget.startRestriction.minute);
        startRestrictionMinute = widget.startRestriction.minute;
      } else {
        startRestrictionMinute = 0;
      }
    });
  }

  @override
  void dispose() {
    PaintingBinding.instance.systemFonts
        .removeListener(_handleSystemFontsChange);
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomCupertinoTimerPicker oldWidget) {
    super.didUpdateWidget(oldWidget);

    assert(
      oldWidget.mode == widget.mode,
      "The CupertinoTimerPicker's mode cannot change once it's built",
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    textDirection = Directionality.of(context);
    localizations = CupertinoLocalizations.of(context);

    _measureLabelMetrics();
  }

  void _measureLabelMetrics() {
    textPainter.textDirection = textDirection;
    final TextStyle textStyle = _textStyleFrom(context);

    double maxWidth = double.negativeInfinity;
    String widestNumber = '';

    // Assumes that:
    // - 2-digit numbers are always wider than 1-digit numbers.
    // - There's at least one number in 1-9 that's wider than or equal to 0.
    // - The widest 2-digit number is composed of 2 same 1-digit numbers
    //   that has the biggest width.
    // - If two different 1-digit numbers are of the same width, their corresponding
    //   2 digit numbers are of the same width.
    for (String input in numbers) {
      textPainter.text = TextSpan(
        text: input,
        style: textStyle,
      );
      textPainter.layout();

      if (textPainter.maxIntrinsicWidth > maxWidth) {
        maxWidth = textPainter.maxIntrinsicWidth;
        widestNumber = input;
      }
    }

    textPainter.text = TextSpan(
      text: '${widestNumber.toString()}$widestNumber',
      style: textStyle,
    );

    textPainter.layout();
    numberLabelWidth = textPainter.maxIntrinsicWidth;
    numberLabelHeight = textPainter.height;
    numberLabelBaseline =
        textPainter.computeDistanceToActualBaseline(TextBaseline.alphabetic);
  }

  // Builds a text label with scale factor 1.0 and font weight semi-bold.
  // `pickerPadding ` is the additional padding the corresponding picker has to apply
  // around the `Text`, in order to extend its separators towards the closest
  // horizontal edge of the encompassing widget.
  Widget _buildLabel(String text, EdgeInsetsDirectional pickerPadding) {
    final EdgeInsetsDirectional padding = EdgeInsetsDirectional.only(
      start: numberLabelWidth + _kTimerPickerLabelPadSize + pickerPadding.start,
    );

    return IgnorePointer(
      child: Container(
        alignment: AlignmentDirectional.centerStart.resolve(textDirection),
        padding: padding.resolve(textDirection),
        child: SizedBox(
          height: numberLabelHeight,
          child: Baseline(
            baseline: numberLabelBaseline,
            baselineType: TextBaseline.alphabetic,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: _kTimerPickerLabelFontSize,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }

  // The picker has to be wider than its content, since the separators
  // are part of the picker.
  Widget _buildPickerNumberLabel(String text, EdgeInsetsDirectional padding) {
    return Container(
      width: _kTimerPickerColumnIntrinsicWidth + padding.horizontal,
      padding: padding.resolve(textDirection),
      alignment: AlignmentDirectional.centerStart.resolve(textDirection),
      child: Container(
        width: numberLabelWidth,
        alignment: AlignmentDirectional.centerEnd.resolve(textDirection),
        child: Text(text,
            softWrap: false, maxLines: 1, overflow: TextOverflow.visible),
      ),
    );
  }

// fix ###############
  Widget _buildHourPicker(EdgeInsetsDirectional additionalPadding) {
    return CupertinoPicker(
      scrollController: FixedExtentScrollController(
          initialItem: selectedHour - widget.startRestriction.hour),
      offAxisFraction: -0.5 * textDirectionFactor,
      itemExtent: _kItemExtent,
      backgroundColor: widget.backgroundColor,
      squeeze: _kSqueeze,
      onSelectedItemChanged: (int index) {
        setState(() {
          selectedHour = widget.startRestriction.hour + index;
          _changeRestrictionMinute();
          widget.onTimerDurationChanged(Duration(
              hours: selectedHour >= 0 ? selectedHour : 0,
              minutes: selectedMinute,
              seconds: selectedSecond >= 0 ? selectedSecond : 0));
        });
      },
      children: _generateHourList(additionalPadding),
    );
  }

  List<Widget> _generateHourList(EdgeInsetsDirectional additionalPadding) {
    List<Widget> widgets = [];
    int startHour = widget.startRestriction.hour;
    int endHour = widget.endRestriction.hour;

    for (var index = startHour; index <= endHour; index++) {
      final String semanticsLabel = textDirectionFactor == 1
          ? localizations.timerPickerHour(index) +
              localizations.timerPickerHourLabel(index).toString()
          : localizations.timerPickerHourLabel(index).toString() +
              localizations.timerPickerHour(index);
      widgets.add(Semantics(
        label: semanticsLabel,
        excludeSemantics: true,
        child: _buildPickerNumberLabel(
            localizations.timerPickerHour(index), additionalPadding),
      ));
    }
    return widgets;
  }
// ####################

  Widget _buildHourColumn(EdgeInsetsDirectional additionalPadding) {
    return Stack(
      children: [
        NotificationListener<ScrollEndNotification>(
          onNotification: (ScrollEndNotification notification) {
            setState(() {
              lastSelectedHour = selectedHour;
            });
            return false;
          },
          child: _buildHourPicker(additionalPadding),
        ),
        _buildLabel(
          localizations
              .timerPickerHourLabel(
                  lastSelectedHour >= 0 ? lastSelectedHour : selectedHour)
              .toString(),
          additionalPadding,
        ),
      ],
    );
  }

// fix ###############
  Widget _buildMinutePicker(EdgeInsetsDirectional additionalPadding) {
    double offAxisFraction;
    switch (widget.mode) {
      case CupertinoTimerPickerMode.hm:
        offAxisFraction = 0.5 * textDirectionFactor;
        break;
      case CupertinoTimerPickerMode.hms:
        offAxisFraction = 0.0;
        break;
      case CupertinoTimerPickerMode.ms:
        offAxisFraction = -0.5 * textDirectionFactor;
    }

    return CupertinoPicker(
      scrollController: FixedExtentScrollController(
        initialItem: selectedMinute ~/ widget.minuteInterval,
      ),
      offAxisFraction: offAxisFraction,
      itemExtent: _kItemExtent,
      backgroundColor: widget.backgroundColor,
      squeeze: _kSqueeze,
      looping: true,
      onSelectedItemChanged: (int index) {
        setState(() {
          selectedMinute =
              index * widget.minuteInterval + startRestrictionMinute;
          widget.onTimerDurationChanged(Duration(
              hours: selectedHour >= 0 ? selectedHour : 0,
              minutes: selectedMinute,
              seconds: selectedSecond));
        });
      },
      children: _generateMinuteList(additionalPadding),
    );
  }

  List<Widget> _generateMinuteList(EdgeInsetsDirectional additionalPadding) {
    List<Widget> widgets = [];
    int iterations = (endRestrictionMinute - startRestrictionMinute) ~/
        widget.minuteInterval;
    if (endRestrictionMinute < 60) iterations = iterations + 1;
    for (var index = 0; index < iterations; index++) {
      final int minute = index * widget.minuteInterval + startRestrictionMinute;
      // print('Checking: ${iterations.toString()}');
      // print('total: ${minute.toString()} = ${index.toString()} * ${widget.minuteInterval.toString()} + ${startRestrictionMinute.toString()}');
      final String semanticsLabel = textDirectionFactor == 1
          ? localizations.timerPickerMinute(minute) +
              localizations.timerPickerMinuteLabel(minute).toString()
          : localizations.timerPickerMinuteLabel(minute).toString() +
              localizations.timerPickerMinute(minute);
      widgets.add(Semantics(
        label: semanticsLabel,
        excludeSemantics: true,
        child: _buildPickerNumberLabel(
            localizations.timerPickerMinute(minute), additionalPadding),
      ));
    }
    return widgets;
  }

// ####################
  Widget _buildMinuteColumn(EdgeInsetsDirectional additionalPadding) {
    return Stack(
      children: [
        NotificationListener<ScrollEndNotification>(
          onNotification: (ScrollEndNotification notification) {
            setState(() {
              lastSelectedMinute = selectedMinute;
              print('EK: ${lastSelectedMinute.toString()}');
            });
            return false;
          },
          child: _buildMinutePicker(additionalPadding),
        ),
        _buildLabel(
          localizations
              .timerPickerMinuteLabel(
                  lastSelectedMinute >= 0 ? lastSelectedMinute : selectedMinute)
              .toString(),
          additionalPadding,
        ),
      ],
    );
  }

  Widget _buildSecondPicker(EdgeInsetsDirectional additionalPadding) {
    final double offAxisFraction = 0.5 * textDirectionFactor;

    return CupertinoPicker(
      scrollController: FixedExtentScrollController(
        initialItem: selectedSecond ~/ widget.secondInterval,
      ),
      offAxisFraction: offAxisFraction,
      itemExtent: _kItemExtent,
      backgroundColor: widget.backgroundColor,
      squeeze: _kSqueeze,
      looping: true,
      onSelectedItemChanged: (int index) {
        setState(() {
          selectedSecond = index * widget.secondInterval;
          widget.onTimerDurationChanged(Duration(
              hours: selectedHour >= 0 ? selectedHour : 0,
              minutes: selectedMinute,
              seconds: selectedSecond));
        });
      },
      children: List<Widget>.generate(60 ~/ widget.secondInterval, (int index) {
        final int second = index * widget.secondInterval;

        final String semanticsLabel = textDirectionFactor == 1
            ? localizations.timerPickerSecond(second) +
                localizations.timerPickerSecondLabel(second).toString()
            : localizations.timerPickerSecondLabel(second).toString() +
                localizations.timerPickerSecond(second);

        return Semantics(
          label: semanticsLabel,
          excludeSemantics: true,
          child: _buildPickerNumberLabel(
              localizations.timerPickerSecond(second), additionalPadding),
        );
      }),
    );
  }

  Widget _buildSecondColumn(EdgeInsetsDirectional additionalPadding) {
    return Stack(
      children: [
        NotificationListener<ScrollEndNotification>(
          onNotification: (ScrollEndNotification notification) {
            setState(() {
              lastSelectedSecond = selectedSecond;
            });
            return false;
          },
          child: _buildSecondPicker(additionalPadding),
        ),
        _buildLabel(
          localizations
              .timerPickerSecondLabel(
                  lastSelectedSecond >= 0 ? lastSelectedSecond : selectedSecond)
              .toString(),
          additionalPadding,
        ),
      ],
    );
  }

  TextStyle _textStyleFrom(BuildContext context) {
    return CupertinoTheme.of(context).textTheme.pickerTextStyle.merge(
          const TextStyle(
            fontSize: _kTimerPickerNumberLabelFontSize,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    // The timer picker can be divided into columns corresponding to hour,
    // minute, and second. Each column consists of a scrollable and a fixed
    // label on top of it.

    List<Widget> columns;
    const double paddingValue = _kPickerWidth -
        2 * _kTimerPickerColumnIntrinsicWidth -
        2 * _kTimerPickerHalfColumnPadding;
    // The default totalWidth for 2-column modes.
    double totalWidth = _kPickerWidth;
    assert(paddingValue >= 0);

    switch (widget.mode) {
      case CupertinoTimerPickerMode.hm:
        // Pad the widget to make it as wide as `_kPickerWidth`.
        columns = [
          _buildHourColumn(const EdgeInsetsDirectional.only(
              start: paddingValue / 2, end: _kTimerPickerHalfColumnPadding)),
          _buildMinuteColumn(const EdgeInsetsDirectional.only(
              start: paddingValue / 2, end: paddingValue / 2)),
        ];
        break;
      case CupertinoTimerPickerMode.ms:
        // Pad the widget to make it as wide as `_kPickerWidth`.
        columns = [
          _buildMinuteColumn(const EdgeInsetsDirectional.only(
              start: paddingValue / 2, end: _kTimerPickerHalfColumnPadding)),
          _buildSecondColumn(const EdgeInsetsDirectional.only(
              start: _kTimerPickerHalfColumnPadding, end: paddingValue / 2)),
        ];
        break;
      case CupertinoTimerPickerMode.hms:
        const double paddingValue = _kTimerPickerHalfColumnPadding * 2;
        totalWidth = _kTimerPickerColumnIntrinsicWidth * 3 +
            4 * _kTimerPickerHalfColumnPadding +
            paddingValue;
        columns = [
          _buildHourColumn(const EdgeInsetsDirectional.only(
              start: paddingValue / 2, end: _kTimerPickerHalfColumnPadding)),
          _buildMinuteColumn(const EdgeInsetsDirectional.only(
              start: _kTimerPickerHalfColumnPadding,
              end: _kTimerPickerHalfColumnPadding)),
          _buildSecondColumn(const EdgeInsetsDirectional.only(
              start: _kTimerPickerHalfColumnPadding, end: paddingValue / 2)),
        ];
        break;
    }
    final CupertinoThemeData themeData = CupertinoTheme.of(context);
    return MediaQuery(
      data: const MediaQueryData(
        // The native iOS picker's text scaling is fixed, so we will also fix it
        // as well in our picker.
        textScaleFactor: 1.0,
      ),
      child: CupertinoTheme(
        data: themeData.copyWith(
          textTheme: themeData.textTheme.copyWith(
            pickerTextStyle: _textStyleFrom(context),
          ),
        ),
        child: Align(
          alignment: widget.alignment,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Huỷ')),
                    InkWell(
                        onTap: () {
                          Navigator.pop(
                              context, [selectedHour, selectedMinute]);
                        },
                        child: const Text('Chọn')),
                  ],
                ),
              ),
              Container(
                color: _kBackgroundColor,
                width: totalWidth,
                height: _kPickerHeight,
                child: DefaultTextStyle(
                  style: _textStyleFrom(context),
                  child: Row(
                      children: columns
                          .map((Widget child) => Expanded(child: child))
                          .toList(growable: false)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
