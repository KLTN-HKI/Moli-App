/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:moli_shared/moli_shared.dart';

class DaySelector extends StatefulWidget {
  const DaySelector({super.key, DateTime? initDate, required this.onDateChanged});
  final void Function(DateTime) onDateChanged;

  @override
  State<DaySelector> createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildPreviousDateButton(),
        _buildCurrentDate(),
        _buildNextDateButton(),
      ].applySeparator(
        separator: SizedBox(width: 16),
      ),
    );
  }

  ClipOval _buildNextDateButton() {
    return ClipOval(
      child: Container(
        color: context.colorScheme.primary.withOpacity(.15),
        height: 32,
        width: 32,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => onDateChange(selectedDate.add(const Duration(days: 1))),
          icon: SvgPicture.asset(
            IconAssets.icArrowRight,
            width: 9,
            color: context.colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Container _buildCurrentDate() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          Text(
            DateTimeUtils.weekDay(selectedDate.weekday),
            style: context.textTheme.titleSmall,
          ),
          Text(
            DateFormat('dd/MM/yyyy').format(selectedDate),
            style: context.textTheme.titleSmall,
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Container(
              width: 25,
              decoration: BoxDecoration(
                  color: ColorPalettes.black,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(2)),
            ),
          )
        ],
      ),
    );
  }

  ClipOval _buildPreviousDateButton() {
    return ClipOval(
      child: Container(
        color: selectedDate.isAfter(DateTime.now())
            ? context.colorScheme.primary.withOpacity(.15)
            : context.colorScheme.onSurface.withOpacity(.1),
        height: 32,
        width: 32,
        child: IconButton(
          onPressed: selectedDate.isAfter(DateTime.now())
              ? () => onDateChange(selectedDate.subtract(const Duration(days: 1)))
              : null,
          splashRadius: 32,
          icon: SvgPicture.asset(
            IconAssets.icArrowLeft,
            width: 9,
            color: selectedDate.isAfter(DateTime.now())
                ? context.colorScheme.primary
                : context.colorScheme.onSurface,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  void onDateChange(DateTime date) {
    setState(() => selectedDate = date);
    widget.onDateChanged(date);
  }
}
 */