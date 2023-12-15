// To parse this JSON data, do
//
//     final yesOrNoModel = yesOrNoModelFromJson(jsonString);
import 'package:yes_no_app/domain/entities/message.dart';

class YesOrNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesOrNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesOrNoModel.fromJsonMap(Map<String, dynamic> json) => YesOrNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    Message toMessageEntity () => Message(
      text: answer == 'yes' ? 'Si' : 'No', 
      fromWho: FromWho.hers,
      imageUrl: image
      );
}
