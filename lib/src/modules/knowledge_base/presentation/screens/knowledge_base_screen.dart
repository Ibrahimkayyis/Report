import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/knowledge_base/domain/models/article_model.dart';
import 'package:report/src/modules/knowledge_base/presentation/cubits/knowledge_base_cubit.dart';
import 'package:report/src/modules/knowledge_base/presentation/cubits/knowledge_base_state.dart';
import 'package:report/src/modules/knowledge_base/presentation/widgets/kb_article_dialog.dart';
import 'package:report/src/modules/knowledge_base/presentation/widgets/kb_category_filter.dart';
import 'package:report/src/modules/knowledge_base/presentation/widgets/kb_faq_grid.dart';
import 'package:report/src/modules/knowledge_base/presentation/widgets/kb_search_bar.dart';
import 'package:report/src/modules/knowledge_base/presentation/widgets/kb_faq_shimmer_grid.dart';

@RoutePage()
class KnowledgeBaseScreen extends StatefulWidget {
  const KnowledgeBaseScreen({super.key});

  @override
  State<KnowledgeBaseScreen> createState() => _KnowledgeBaseScreenState();
}

class _KnowledgeBaseScreenState extends State<KnowledgeBaseScreen> {
  bool _isFocused = false;
  String _searchQuery = '';
  String _selectedCategory = 'Semua';

  void _setFocused(bool v) {
    if (mounted) setState(() => _isFocused = v);
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final screenWidth = MediaQuery.of(context).size.width;
    final normalWidth = screenWidth - 2 * 36.w;
    final focusedWidth = (screenWidth * 0.92) - 2 * 20.w;

    final containerWidth = _isFocused
        ? focusedWidth.clamp(200.w, screenWidth)
        : normalWidth.clamp(200.w, screenWidth);

    return BlocProvider(
      create: (_) => sl<KnowledgeBaseCubit>()..fetchKnowledgeBaseData(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppPrimaryBar(title: t.app.knowledge_base_title),
        body: BlocBuilder<KnowledgeBaseCubit, KnowledgeBaseState>(
          builder: (context, state) {
            final isLoading = state is KnowledgeBaseLoading;
            final isLoaded = state is KnowledgeBaseLoaded;

            // prepare tags & articles safely
            final tags = isLoaded
                ? ['Semua', ...state.tags.map((e) => e.name)]
                : ['Semua'];
            final List<ArticleModel> allArticles = isLoaded
                ? state.articles
                : <ArticleModel>[];

            // filter by selected category
            final filteredArticles = _selectedCategory == 'Semua'
                ? allArticles
                : allArticles
                      .where(
                        (a) =>
                            a.tags.any((tag) => tag.name == _selectedCategory),
                      )
                      .toList();

            // filter by search query
            final visibleArticles = _searchQuery.isEmpty
                ? filteredArticles
                : filteredArticles
                      .where(
                        (a) => (a.title).toLowerCase().contains(
                          _searchQuery.toLowerCase(),
                        ),
                      )
                      .toList();

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(24.r),
                    boxShadow: [
                      BoxShadow(
                        color: ColorName.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Title
                      Text(
                        t.app.knowledge_base_title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorName.primary,
                        ),
                      ),
                      SizedBox(height: 8.h),

                      // Subtitle
                      Text(
                        t.app.knowledge_base_subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Search Bar
                      KbSearchBar(
                        isFocused: _isFocused,
                        containerWidth: containerWidth,
                        hintText: t.app.search_here,
                        onFocusTap: () => _setFocused(true),
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                            _isFocused = _searchQuery.isNotEmpty;
                          });
                        },
                        onSubmitted: (_) => _setFocused(false),
                      ),
                      SizedBox(height: 24.h),

                      // Category Filter
                      // 🔹 Category Filter + Shimmer on Loading
                      if (isLoading)
                        const KbCategoryFilterShimmer()
                      else
                        KbCategoryFilter(
                          categories: tags,
                          selectedCategory: _selectedCategory,
                          onCategorySelected: (category) {
                            setState(() {
                              _selectedCategory = category;
                            });
                          },
                        ),

                      SizedBox(height: 20.h),

                      // Grid Area
                      Builder(
                        builder: (_) {
                          if (isLoading) {
                            return const KbFaqShimmerGrid();
                          }

                          if (state is KnowledgeBaseError) {
                            return Padding(
                              padding: EdgeInsets.only(top: 40.h),
                              child: AppErrorWidget(
                                message: state.message,
                                onRetry: () => context
                                    .read<KnowledgeBaseCubit>()
                                    .fetchKnowledgeBaseData(),
                              ),
                            );
                          }

                          if (visibleArticles.isEmpty) {
                            return Padding(
                              padding: EdgeInsets.only(top: 40.h),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    size: 50.sp,
                                    color: Colors.grey.shade400,
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    t.app.no_report_history,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          // Loaded -> show real grid with correct tags
                          return KbFaqGrid(
                            articles: visibleArticles,
                            onFaqTap: (article) {
                              showDialog(
                                context: context,
                                builder: (_) => KbArticleDialog(
                                  title: article.title,
                                  author: article.authorName,
                                  category: article.tags.isNotEmpty
                                      ? article.tags.first.name
                                      : 'Tanpa Kategori',
                                  imageUrl:
                                      (article.coverPath?.isNotEmpty ?? false)
                                      ? article.coverPath!
                                      : 'https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg',
                                  paragraphs: [article.content],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
