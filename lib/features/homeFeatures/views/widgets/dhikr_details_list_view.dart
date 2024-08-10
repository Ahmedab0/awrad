
import 'package:flutter/material.dart';

import 'dhikr_details_item.dart';

class DhikrDetailsListView extends StatelessWidget {
  const DhikrDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 15,
      itemBuilder: (context, index) => DhikrDetailsItem(
        title: '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description: '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]',
        index: index,
      ),
    );
  }
}
