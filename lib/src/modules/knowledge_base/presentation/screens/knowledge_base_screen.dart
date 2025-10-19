import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:standard_searchbar/old/standard_searchbar.dart';

@RoutePage()
class KnowledgeBaseScreen extends StatefulWidget {
  const KnowledgeBaseScreen({super.key});

  @override
  State<KnowledgeBaseScreen> createState() => _KnowledgeBaseScreenState();
}

class _KnowledgeBaseScreenState extends State<KnowledgeBaseScreen> {
  bool _isFocused = false;
  String _searchQuery = '';

  void _setFocused(bool v) {
    if (mounted) setState(() => _isFocused = v);
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final screenWidth = MediaQuery.of(context).size.width;
    // normal width slightly inset (match container padding)
    final normalWidth = screenWidth - 2 * 36.w; // container padding + internal
    final focusedWidth = (screenWidth * 0.92) - 2 * 20.w;

    final containerWidth = _isFocused
        ? focusedWidth.clamp(200.w, screenWidth)
        : normalWidth.clamp(200.w, screenWidth);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppPrimaryBar(title: t.app.knowledge_base_title),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
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

                // Animated search bar wrapper (tap to focus + onChanged)
                GestureDetector(
                  onTap: () => _setFocused(true),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeInOut,
                    width: containerWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      boxShadow: _isFocused
                          ? [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    // Use StandardSearchBar (only properties from its API)
                    child: StandardSearchBar(
                      width: containerWidth.toDouble(),
                      height: 48,
                      borderRadius: 25,
                      backgroundColor: Colors.grey.shade100,
                      hintText: t.app.search_here,
                      startIcon: Icons.search,
                      startIconColor: Colors.grey.shade600,
                      showStartIcon: true,
                      startIconOnTap: () {
                        // if tapped on icon, ensure focused state
                        _setFocused(true);
                      },
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                          _isFocused = _searchQuery.isNotEmpty;
                        });
                      },
                      onSubmitted: (value) {
                        _setFocused(false);
                      },

                      // 🔹 No shadow applied
                      shadow: const [],

                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        color: ColorName.textPrimary,
                      ),
                      suggestions: const [
                        'Cara membuat tiket baru',
                        'Cek status tiket',
                        'Hubungi support',
                        'Reset password',
                        'Waktu penanganan tiket',
                        'Belum mendapat respon',
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                _buildFAQGrid(context, t),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFAQGrid(BuildContext context, Translations t) {
    final List<String> faqs = [
      t.app.faq_how_to_create_ticket,
      t.app.faq_how_to_check_ticket_status,
      t.app.faq_guide_contact_support,
      t.app.faq_guide_reset_password,
      t.app.faq_how_long_ticket_processing,
      t.app.faq_what_to_do_no_response,
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 1,
      ),
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        return _buildFAQCard(faqs[index]);
      },
    );
  }

  Widget _buildFAQCard(String question) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.primary,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorName.primary.withOpacity(0.15),
            blurRadius: 6.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              question,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                height: 1.3,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 8.h),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_right, color: Colors.white, size: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
