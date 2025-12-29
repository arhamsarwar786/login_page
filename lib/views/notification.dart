import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_page/model/notification_model.dart';
import 'package:login_page/utils/app_color.dart';
import 'package:login_page/views/widgets/filter_button.dart';
import 'package:login_page/views/widgets/notification_card.dart';
import 'package:login_page/views/widgets/notification_data.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  String filter = 'all';
  late List<NotificationModel> notifications;
  Size get size => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    notifications = NotificationData.getNotifications();
  }

  int get unreadCount => notifications.where((n) => !n.read).length;

  List<NotificationModel> get filteredNotifications {
    return filter == 'unread'
        ? notifications.where((n) => !n.read).toList()
        : notifications;
  }

  void markAsRead(int id) {
    setState(() {
      final index = notifications.indexWhere((n) => n.id == id);
      if (index != -1) {
        notifications[index].read = true;
      }
    });
  }

  void deleteNotification(int id) {
    setState(() {
      notifications.removeWhere((n) => n.id == id);
    });
  }

  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification.read = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF9A8D4),
              Color(0xFFC084FC),
              Color(0xFF818CF8),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildFilterButtons(),
                const SizedBox(height: 20),
                _buildNotificationsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: (){context.pop();}, icon: const Icon(Icons.arrow_back)),
            Text(
              'Notifications',
              style: TextStyle(
                fontFamily: "hel",
                fontSize:size.width>600? 32:20,
                fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,
                color: AppColor.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Stay updated with your team activities',
              style: TextStyle(overflow:TextOverflow.ellipsis ,
                fontFamily: "hel",
                fontSize:size.width>600? 14:10,
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
            color: AppColor.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$unreadCount Unread',
            style: const TextStyle(overflow: TextOverflow.ellipsis,
              fontFamily: "hel",
              color: AppColor.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButtons() {
    return SingleChildScrollView(
      child: Row(
        children: [
          FilterButton(
            label: 'All',
            isSelected: filter == 'all',
            onTap: () => setState(() => filter = 'all'),
          ),
          const SizedBox(width: 12),
          FilterButton(
            label: 'Unread',
            isSelected: filter == 'unread',
            onTap: () => setState(() => filter = 'unread'),
          ),
          const Spacer(),
          if (unreadCount > 0)
            TextButton(
              onPressed: markAllAsRead,
              style: TextButton.styleFrom(
                backgroundColor: AppColor.white.withOpacity(0.2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child:  Text(
                'Mark all as read',
                style: TextStyle(
                  color: AppColor.white,
                  fontFamily: "hel",fontSize: size.width>430?12:10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList() {
    return Expanded(
      child: filteredNotifications.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              itemCount: filteredNotifications.length,
              itemBuilder: (context, index) {
                final notification = filteredNotifications[index];
                return NotificationCard(
                  notification: notification,
                  onMarkAsRead: () => markAsRead(notification.id),
                  onDelete: () => deleteNotification(notification.id),
                );
              },
            ),
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
            color: AppColor.white.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No notifications to show',
            style: TextStyle(
              fontSize: 18,
              color: AppColor.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
