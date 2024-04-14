// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sportion/library.dart';

class ExpandableText extends StatelessWidget {
  final String? text;

  const ExpandableText({
    super.key,
    required this.text,
  });

  static const int maxLinesToShow = 1;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> expanded = ValueNotifier(false);

    final TextSpan textSpan = TextSpan(
      text: text ?? "",
      style: context.theme.textTheme.bodyMedium,
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      maxLines: expanded.value ? null : maxLinesToShow,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

    final int numberOfLines = textPainter.computeLineMetrics().length;
    return ValueListenableBuilder(
      valueListenable: expanded,
      builder: (context, values, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (!expanded.value && numberOfLines >= maxLinesToShow) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text ?? "",
                        maxLines: maxLinesToShow,
                        overflow: TextOverflow.ellipsis,
                        style: context.theme.textTheme.bodyMedium,
                      ),
                      /* See More :: type 1 - See More | 2 - See Less */
                      SeeMoreLessWidget(
                        textData: 'See More',
                        type: 1,
                        section: 1,
                        onSeeMoreLessTap: () {
                          expanded.value = true;
                        },
                      ),
                      /* See More :: type 1 - See More | 2 - See Less */
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text ?? "",
                        style: context.theme.textTheme.bodyMedium,
                      ),
                      if (expanded.value && numberOfLines >= maxLinesToShow)
                        /* See Less :: type 1 - See More | 2 - See Less */
                        SeeMoreLessWidget(
                          textData: 'See Less',
                          type: 2,
                          section: 1,
                          onSeeMoreLessTap: () {
                            expanded.value = false;
                          },
                        ),
                      /* See Less :: type 1 - See More | 2 - See Less */
                    ],
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class SeeMoreLessWidget extends StatelessWidget {
  final String? textData;
  final int? type; /* type 1 - See More | 2 - See Less */
  final Function? onSeeMoreLessTap;
  final int?
      section; /* 1: About the course | 2 - Who can take up this course? | 3 - Mentors | 4 - Course Video Reviews */

  const SeeMoreLessWidget({
    super.key,
    required this.textData,
    required this.type,
    required this.onSeeMoreLessTap,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: InkWell(
          onTap: () {
            if (onSeeMoreLessTap != null) {
              onSeeMoreLessTap!();
            }
          },
          child: Text.rich(
            softWrap: true,
            style: context.theme.textTheme.bodyMedium,
            textAlign: TextAlign.start,
            TextSpan(
              text: "",
              children: [
                TextSpan(
                    text: textData,
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.deepPurple,
                    )),
                const WidgetSpan(
                  child: SizedBox(
                    width: 3.0,
                  ),
                ),
                WidgetSpan(
                  child: Icon(
                    (type == 1)
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.deepPurple,
                    size: 17.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
