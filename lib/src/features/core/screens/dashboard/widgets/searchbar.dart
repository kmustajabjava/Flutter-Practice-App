import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/text_strings.dart';

class DashBoardSearchBox extends StatelessWidget {
  const DashBoardSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration:
          const BoxDecoration(border: Border(left: BorderSide(width: 4))),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.mic,
                    size: 25,
                  ),
                  onPressed: () { printError(info: 'Voice icon pressed');},
                ),
                labelText: tDashboardSearch,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.apply(color: Colors.grey.withOpacity(0.5)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
