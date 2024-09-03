import 'package:flutter/material.dart';

import '../../data/models/dhikr_details_item_model.dart';
import 'dhikr_details_item.dart';

class DhikrDetailsListView extends StatelessWidget {
  const DhikrDetailsListView({super.key, required this.clr});

  final Color clr;

  final List<DhikrDetailsItemModel> items = const [
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
    DhikrDetailsItemModel(
        title:
            '﴿ إِذَا سَمِعْتُمُ النِّدَاءَ، فَقُولُوا كَمَا يَقُولُ المُؤذِّنُ ﴾',
        description:
            '[ بعد انتهاء أذان الفجر والمغرب: ضعيف الجامع للألباني:4123 ]'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => DhikrDetailsItem(
        dhikrDetailsItemModel: items[index],
        index: index,
        clr: clr,
      ),
    );
  }
}
