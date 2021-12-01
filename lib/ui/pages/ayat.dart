import 'package:flutter/material.dart';
import 'package:untitled/quran_data/data.dart';

class Ayat extends StatelessWidget {
  final int index;
  const Ayat({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              QuranData.surahName[index],
            // style: const TextStyle(fontFamily: "Jameel"),
            softWrap: false,
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 24),
          itemBuilder: (_, int index){
          String quran = surahQuran[index];
          String translation = translations[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              leading: Text("${index+1}"),
              title: SelectableText(quran.trim(),style: const TextStyle(fontFamily: "Noorehuda",fontSize: 24,height: 1.5),),
              subtitle: SelectableText(translation,style: const TextStyle(fontFamily: "Jameel",fontSize: 22,height: 1.5)),
            ),
          );
        }, itemCount: surahQuran.length,),
      ),
    );
  }

  List<String> get surahQuran{
    final List<String> list = [];
    for (int i = QuranData.surahIndexInfo[index]; i < QuranData.surahIndexInfo[index+1]; i++) {
      list.add(QuranData.quranArabic[i]);
    }
    return list;
  }

  List<String> get translations{
    final List<String> list = [];
    for (int i = QuranData.surahIndexInfo[index]; i < QuranData.surahIndexInfo[index+1]; i++) {
      list.add(QuranData.translation[i]);
    }
    return list;
  }
}
