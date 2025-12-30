import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/viewmodel/notification_view_model.dart';
import 'package:provider/provider.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/views/widgets/filter_button.dart';
import 'package:login_page/views/widgets/notification_card.dart';

class Notifications extends StatelessWidget {
  const Notifications ({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => NotificationProvider(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
               AppColor.lightpink,AppColor.lightorange,AppColor.light1blue
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, size),
                  const SizedBox(height: 20),
                  _buildFilterButtons(context, size),
                  const SizedBox(height: 20),
                  _buildNotificationsList(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Size size) {
    return Consumer<NotificationProvider>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontFamily: "hel",
                    fontSize: size.width > 600 ? 32 : 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: AppColor.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Stay updated with your team activities',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "hel",
                    fontSize: size.width > 600 ? 14 : 10,
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColor.lightwhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${provider.unreadCount} Unread',
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: "hel",
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFilterButtons(BuildContext context, Size size) {
    return Consumer<NotificationProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Row(
            children: [
              FilterButton(
                label: 'All',
                isSelected: provider.filter == 'all',
                onTap: () => provider.setFilter('all'),
              ),
              const SizedBox(width: 12),
              FilterButton(
                label: 'Unread',
                isSelected: provider.filter == 'unread',
                onTap: () => provider.setFilter('unread'),
              ),
              const Spacer(),
              if (provider.unreadCount > 0)
                TextButton(
                  onPressed: provider.markAllAsRead,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColor.lightwhite,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Mark all as read',
                    style: TextStyle(
                      color: AppColor.white,
                      fontFamily: "hel",
                      fontSize: size.width > 430 ? 12 : 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNotificationsList(BuildContext context) {
    return Consumer<NotificationProvider>(
      builder: (context, provider, child) {
        return Expanded(
          child: provider.filteredNotifications.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  itemCount: provider.filteredNotifications.length,
                  itemBuilder: (context, index) {
                    final notification = provider.filteredNotifications[index];
                    return NotificationCard(
                      notification: notification,
                      onMarkAsRead: () => provider.markAsRead(notification.id),
                      onDelete: () => provider.deleteNotification(notification.id),
                    );
                  },
                ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none_rounded,
            size: 64,
            color: AppColor.white,
          ),
          const SizedBox(height: 16),
          Text(
            'No notifications to show',
            style: TextStyle(
              fontSize: 18,
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}