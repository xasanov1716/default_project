import 'package:flutter/material.dart';

class VolumeChanger extends StatelessWidget {
  const VolumeChanger(
      {Key? key, required this.currentVolume, required this.onVolumeChanged})
      : super(key: key);

  final int currentVolume;
  final ValueChanged<int> onVolumeChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 30,
      child: Row(
        children: [
          ...List.generate(
            10,
                (index) => Expanded(
              child: GestureDetector(
                onTap: () {
                  onVolumeChanged.call(index + 1);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ((index + 1) <= currentVolume)
                          ? Colors.green
                          : Colors.grey,
                      border: const Border.symmetric(
                          vertical: BorderSide(color: Colors.black26))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}