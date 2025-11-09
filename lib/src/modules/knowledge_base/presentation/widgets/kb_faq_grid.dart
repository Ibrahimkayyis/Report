import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/src/modules/knowledge_base/domain/models/article_model.dart';
import 'package:report/src/modules/knowledge_base/presentation/widgets/kb_faq_card.dart';

class KbFaqGrid extends StatelessWidget {
  final List<ArticleModel> articles;
  final void Function(ArticleModel article)? onFaqTap;

  const KbFaqGrid({
    super.key,
    required this.articles,
    this.onFaqTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final article = articles[index];

        final categoryLabel = article.tags.isNotEmpty ? article.tags.first.name : 'Tanpa Kategori';

        return KbFaqCard(
          question: article.title,
          category: categoryLabel,
          onTap: onFaqTap != null ? () => onFaqTap!(article) : null,
        );
      },
    );
  }
}
