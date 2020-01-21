// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import 'date_panel.dart';
import 'info_panel.dart';
import '../utils.dart';

/// A basic digital clock.
///
/// You can do better than this!
class NeovoClock extends StatefulWidget {
  const NeovoClock(this.model);

  final ClockModel model;

  @override
  _NeovoClockState createState() => _NeovoClockState();
}

class _NeovoClockState extends State<NeovoClock> {
  NeovoDateTime _dateTime = NeovoDateTime(DateTime.now(), true);
  NeovoTheme _theme;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(NeovoClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {});
  }

  void _updateTime() {
    setState(() {
      DateTime dT = DateTime.now();
      _dateTime = NeovoDateTime(dT, widget.model.is24HourFormat);
      // Update once per minute. If you want to update every second, use the
      // following code.
      // _timer = Timer(
      //   Duration(minutes: 1) -
      //       Duration(seconds: _dateTime.second) -
      //       Duration(milliseconds: _dateTime.millisecond),
      //   _updateTime,
      // );
      // Update once per second, but make sure to do it at the beginning of each
      // new second, so that the clock is accurate.
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: dT.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    NeovoDimensions _dimensions =
        NeovoDimensions(MediaQuery.of(context).size.height);
    NeovoTheme _theme = NeovoTheme(Theme.of(context).brightness);
    return Container(
      color: _theme.colors[NeovoThemeElement.background],
      child: DefaultTextStyle(
        style: _theme.textStyleSizedBold(_dimensions.fontSize),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: _dimensions.clockOffset,
              top: _dimensions.clockOffset,
              child: CircularProgressIndicator(
                strokeWidth: _dimensions.clockDiameter,
                value: _dateTime.sec,
                valueColor: AlwaysStoppedAnimation(
                    _theme.colors[NeovoThemeElement.highlight]),
              ),
            ),
            Positioned(
              left: _dimensions.clockOffset,
              top: _dimensions.clockOffset,
              child: CircularProgressIndicator(
                strokeWidth: _dimensions.clockDiameter * 0.94,
                value: 1,
                valueColor: AlwaysStoppedAnimation(
                    _theme.colors[NeovoThemeElement.background]),
              ),
            ),
            Positioned(
              left: _dimensions.clockOffset,
              top: _dimensions.clockOffset,
              child: CircularProgressIndicator(
                strokeWidth: _dimensions.clockDiameter * 0.92,
                value: _dateTime.min,
                valueColor: AlwaysStoppedAnimation(
                    _theme.colors[NeovoThemeElement.highlight]),
              ),
            ),
            Positioned(
              left: _dimensions.clockOffset,
              top: _dimensions.clockOffset,
              child: CircularProgressIndicator(
                strokeWidth: _dimensions.clockDiameter * 0.86,
                value: 1,
                valueColor: AlwaysStoppedAnimation(
                    _theme.colors[NeovoThemeElement.background]),
              ),
            ),
            Positioned(
              left: _dimensions.clockOffset,
              top: _dimensions.clockOffset,
              child: CircularProgressIndicator(
                strokeWidth: _dimensions.clockDiameter * 0.84,
                value: _dateTime.hr,
                valueColor: AlwaysStoppedAnimation(
                    _theme.colors[NeovoThemeElement.highlight]),
              ),
            ),
            Positioned(
              left: _dimensions.clockOffset,
              top: _dimensions.clockOffset,
              child: CircularProgressIndicator(
                strokeWidth: _dimensions.clockDiameter * 0.78,
                value: 1,
                valueColor: AlwaysStoppedAnimation(
                    _theme.colors[NeovoThemeElement.background]),
              ),
            ),
            Positioned(
              left: (_dimensions.clockRadius * 0.35) + NeovoDimensions.padding,
              top: _dimensions.clockOffset - (_dimensions.clockRadius * 0.25),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      '${_dateTime.hour}:${_dateTime.minute}',
                      style: _theme.textStyleSizedBold(_dimensions.fontSize),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                color: _theme.colors[NeovoThemeElement.highlight],
                height: _dimensions.clockRadius * 0.75,
                width: _dimensions.clockDiameter * 0.75,
              ),
            ),
            Positioned(
              child: Column(
                children: <Widget>[
                  NeovoDatePanel(_dateTime, _dimensions, _theme),
                  SizedBox(height: NeovoDimensions.padding),
                  NeovoInfoPanel(widget.model, _dimensions, _theme),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              left: _dimensions.clockDiameter + (NeovoDimensions.padding * 8),
              top: NeovoDimensions.padding * 4,
            ),
          ],
        ),
      ),
    );
  }
}
