import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moli_app/constants/color_palattes.dart';
import 'package:moli_app/constants/icon_assets.dart';
import 'package:moli_app/shared/shared.dart';

class AppointmentDateTimePicker extends StatefulWidget {
  const AppointmentDateTimePicker({
    super.key,
    required this.onChange,
    this.initialDate,
    this.minimumDate,
    this.maximumDate,
    this.label,
    this.invalid = false,
  });

  final ValueChanged<DateTime?> onChange;
  final String? label;
  final DateTime? initialDate;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final bool invalid;

  @override
  State<AppointmentDateTimePicker> createState() =>
      _AbsenceDatetimeStatePicker();
}

class _AbsenceDatetimeStatePicker extends State<AppointmentDateTimePicker> {
  DateTime? initial;
  DateTime? minimum;
  DateTime? maximum;
  final int minuteInterval = 5;
  DateTime? result;

  @override
  void initState() {
    super.initState();
    _vaildDate();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        _vaildDate();
        result = await context.showCupertinoDialog<DateTime?>(
          barrierDismissible: false,
          dialogHeight: context.height * .4,
          child: Column(
            children: <Widget>[
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  dateOrder: DatePickerDateOrder.dmy,
                  // use24hFormat: true,
                  minuteInterval: minuteInterval,
                  initialDateTime: initial,
                  minimumDate: minimum,
                  maximumDate: maximum,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      result = newDate;
                    });
                  },
                ),
              ),
              AppElevatedButton(
                  child: Text(context.l10n.confirm),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pop(result ?? initial);
                  }),
              AppOutlinedButton(
                  primary: context.colorScheme.onSecondaryContainer,
                  child: Text(context.l10n.cancel),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  }),
            ].applySeparator(separator: const SizedBox(height: 8)),
          ),
        );
        widget.onChange(result);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                  color: widget.invalid
                      ? context.colorScheme.error
                      : ColorPalettes.neutralVariant50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: <Widget>[
                const AppIcon(IconAssets.icCalendar, size: 24),
                const SizedBox(width: 16),
                if (result == null)
                  AppText.b0(widget.label ?? 'yyyy-MM-dd',
                      color: ColorPalettes.neutral80)
                else
                  AppText.b0('${DateTimeUtils.formatDateTimeDateOnly(result)}'),
              ],
            ),
          ),
          if (widget.invalid) ...<Widget>[
            const SizedBox(height: 4),
            AppText.b2('    ${widget.label} không hợp lệ *',
                color: context.colorScheme.error)
          ]
        ],
      ),
    );
  }

  void _vaildDate() {
    // Now datetime
    final DateTime now = DateTime.now();
    // Minimun datetime
    if (widget.minimumDate != null && now.isBefore(widget.minimumDate!)) {
      minimum = widget.minimumDate;
    } else {
      minimum = now;
    }
    // Maximun datetime
    if (widget.maximumDate != null && now.isBefore(widget.maximumDate!)) {
      maximum = widget.maximumDate;
    } else {
      maximum = null;
    }
    // Initial datetime
    initial = now.add(Duration(
      minutes: minuteInterval - now.minute % minuteInterval,
    ));
    if (widget.initialDate != null) {
      if (initial!.isBefore(widget.initialDate!)) {
        initial = widget.initialDate!.add(Duration(
          minutes: minuteInterval - widget.initialDate!.minute % minuteInterval,
        ));
      }
      // Result datetime
      result ??= initial;
    }
    if (minimum != null && initial!.isBefore(minimum!)) {
      minimum = initial;
    }
    if (maximum != null && initial!.isAfter(maximum!)) {
      maximum = initial;
    }
  }
}
