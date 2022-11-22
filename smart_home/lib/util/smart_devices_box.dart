import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmartDevicesBox extends StatefulWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;

  SmartDevicesBox({
    Key? key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SmartDevicesBox> createState() => _SmartDevicesBoxState();
}

class _SmartDevicesBoxState extends State<SmartDevicesBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
          decoration: BoxDecoration(
            color:widget.powerOn? Colors.grey[900] : Colors.grey[200],
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //icon
              Image.asset(
                widget.iconPath,
                height: 65,
                color: widget.powerOn ? Colors.white : Colors.black,
              ),

              //smart device name + switch
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        widget.smartDeviceName,
                        style:  TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: widget.powerOn ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle:pi/2,
                    child: CupertinoSwitch(
                      value: widget.powerOn,
                      onChanged: widget.onChanged,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
