import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/test_helper/presentation/cubits/test_helper_cubit.dart';

@RoutePage()
class TestHelperScreen extends StatelessWidget {
  const TestHelperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TestHelperCubit>()..loadTokenInfo(),
      child: const _TestHelperView(),
    );
  }
}

class _TestHelperView extends StatelessWidget {
  const _TestHelperView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🧪 Token Test Helper'),
        backgroundColor: ColorName.primary,
        foregroundColor: ColorName.onPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<TestHelperCubit>().loadTokenInfo();
            },
          ),
        ],
      ),
      body: BlocBuilder<TestHelperCubit, TestHelperState>(
        builder: (context, state) {
          if (state is TestHelperLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TestHelperError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error, size: 64, color: Colors.red),
                  SizedBox(height: 16.h),
                  Text('Error: ${state.message}'),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<TestHelperCubit>().loadTokenInfo();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is TestHelperLoaded) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Token Info Card
                  _buildTokenInfoCard(context, state),
                  SizedBox(height: 16.h),

                  // Test Scenarios
                  _buildTestScenariosCard(context),
                  SizedBox(height: 16.h),

                  // Quick Actions
                  _buildQuickActionsCard(context),
                  SizedBox(height: 16.h),

                  // Logs
                  _buildLogsCard(context, state),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildTokenInfoCard(BuildContext context, TestHelperLoaded state) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.info_outline, color: ColorName.primary),
                SizedBox(width: 8.w),
                Text(
                  'Current Token Info',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            _buildInfoRow(
              'Access Token',
              state.accessToken != null && state.accessToken!.isNotEmpty
                  ? '${state.accessToken!.substring(0, state.accessToken!.length > 30 ? 30 : state.accessToken!.length)}...'
                  : 'Not set',
              state.accessToken != null && state.accessToken!.isNotEmpty
                  ? Colors.green
                  : Colors.red,
            ),
            SizedBox(height: 8.h),
            _buildInfoRow(
              'Refresh Token',
              state.refreshToken != null && state.refreshToken!.isNotEmpty
                  ? '${state.refreshToken!.substring(0, state.refreshToken!.length > 30 ? 30 : state.refreshToken!.length)}...'
                  : 'Not set',
              state.refreshToken != null && state.refreshToken!.isNotEmpty
                  ? Colors.green
                  : Colors.red,
            ),
            SizedBox(height: 8.h),
            _buildInfoRow(
              'Role',
              state.role ?? 'Not set',
              state.role != null ? Colors.blue : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestScenariosCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.science, color: ColorName.primary),
                SizedBox(width: 8.w),
                Text(
                  'Test Scenarios',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            
            // Scenario 1
            _buildTestScenarioButton(
              context,
              icon: Icons.access_time,
              title: 'Test Auto-Refresh',
              subtitle: 'Invalidate access token (1 hour expired)',
              color: Colors.orange,
              onTap: () {
                context.read<TestHelperCubit>().invalidateAccessToken();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Access token invalidated. Now try to call Profile API!'),
                    backgroundColor: Colors.orange,
                  ),
                );
              },
            ),
            SizedBox(height: 12.h),

            // Scenario 2
            _buildTestScenarioButton(
              context,
              icon: Icons.logout,
              title: 'Test Auto-Logout',
              subtitle: 'Invalidate both tokens (7 days expired)',
              color: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (dialogContext) => AlertDialog(
                    title: const Text('⚠️ Confirm Test'),
                    content: const Text(
                      'This will invalidate both tokens and simulate a 7-day expired scenario.\n\n'
                      'After this, call Profile API to trigger auto-logout.\n\n'
                      'Continue?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(dialogContext),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          context.read<TestHelperCubit>().invalidateBothTokens();
                        },
                        child: const Text('Invalidate'),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 12.h),

            // Test API Call
            _buildTestScenarioButton(
              context,
              icon: Icons.api,
              title: 'Back to App',
              subtitle: 'Return to main screen, then go to Profile tab',
              color: Colors.blue,
              onTap: () {
                // Pop back to main layout
                context.router.maybePop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      '✅ Tokens invalidated!\n'
                      '👉 Now tap Profile tab to trigger API call\n'
                      '📊 Check console logs for auto-refresh/logout',
                    ),
                    backgroundColor: Colors.blue,
                    duration: const Duration(seconds: 5),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.flash_on, color: ColorName.primary),
                SizedBox(width: 8.w),
                Text(
                  'Quick Actions',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<TestHelperCubit>().clearAllTokens();
                    },
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Clear All'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<TestHelperCubit>().loadTokenInfo();
                    },
                    icon: const Icon(Icons.refresh),
                    label: const Text('Refresh'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorName.primary,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogsCard(BuildContext context, TestHelperLoaded state) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.article, color: ColorName.primary),
                    SizedBox(width: 8.w),
                    Text(
                      'Logs',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: () {
                    context.read<TestHelperCubit>().clearLogs();
                  },
                  icon: const Icon(Icons.clear_all, size: 16),
                  label: const Text('Clear'),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              height: 200.h,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: state.logs.isEmpty
                  ? Center(
                      child: Text(
                        'No logs yet',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: state.logs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Text(
                            state.logs[index],
                            style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 12.sp,
                              fontFamily: 'monospace',
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120.w,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 14.sp,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildTestScenarioButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          border: Border.all(color: color.withValues(alpha:0.3)),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: color.withValues(alpha:0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: color, size: 24.sp),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}