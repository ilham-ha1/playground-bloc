// lib/history_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Immutable history item.
class HistoryItem {
  final String id;
  final String title;
  final String? subtitle;
  final DateTime timestamp;
  final IconData? leadingIcon;

  const HistoryItem({
    required this.id,
    required this.title,
    required this.timestamp,
    this.subtitle,
    this.leadingIcon,
  });
}

/// Stateless History screen with date-grouped sections.
class HistoryScreen extends StatelessWidget {
  final List<HistoryItem> items;
  final void Function(HistoryItem item)? onItemTap;
  final void Function(HistoryItem item)? onItemLongPress;
  final void Function(HistoryItem item)? onItemDismissed;
  final String emptyMessage;

  const HistoryScreen({
    super.key,
    required this.items,
    this.onItemTap,
    this.onItemLongPress,
    this.onItemDismissed,
    this.emptyMessage = 'No history yet',
  });

  @override
  Widget build(BuildContext context) {
    final grouped = _groupBySection(items);
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: grouped.isEmpty
          ? _EmptyState(message: emptyMessage)
          : CustomScrollView(
              slivers: [
                for (final entry in grouped.entries) ...[
                  _SectionHeader(title: entry.key),
                  SliverList.builder(
                    itemCount: entry.value.length,
                    itemBuilder: (context, index) {
                      final item = entry.value[index];
                      final tile = _HistoryTile(
                        item: item,
                        onTap: onItemTap,
                        onLongPress: onItemLongPress,
                      );
                      if (onItemDismissed == null) return tile;
                      // Dismiss is offered only if callback provided (stateless: delegate state upward).
                      return Dismissible(
                        key: ValueKey(item.id),
                        direction: DismissDirection.endToStart,
                        background: const _DismissBg(),
                        onDismissed: (_) => onItemDismissed?.call(item),
                        child: tile,
                      );
                    },
                  ),
                ],
                const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
              ],
            ),
    );
  }

  /// Groups items into human-readable date buckets with stable ordering.
  Map<String, List<HistoryItem>> _groupBySection(List<HistoryItem> all) {
    if (all.isEmpty) return const {};
    final now = DateTime.now();
    // Sort newest first to keep sections stable.
    final sorted = [...all]..sort((a, b) => b.timestamp.compareTo(a.timestamp));

    final Map<String, List<HistoryItem>> buckets = {};
    for (final item in sorted) {
      final label = _sectionLabel(item.timestamp, now);
      (buckets[label] ??= []).add(item);
    }

    // Preserve preferred order where possible.
    final orderedKeys = <String>[];
    for (final key in ['Today', 'Yesterday', 'This Week']) {
      if (buckets.containsKey(key)) orderedKeys.add(key);
    }
    // Remaining keys (e.g., explicit dates for earlier weeks).
    final remaining = buckets.keys
        .where((k) => !orderedKeys.contains(k))
        .toList(growable: false);
    orderedKeys.addAll(remaining);

    return {for (final k in orderedKeys) k: buckets[k]!};
  }

  /// Returns human bucket labels.
  String _sectionLabel(DateTime when, DateTime now) {
    final d = DateUtils.dateOnly(when);
    final today = DateUtils.dateOnly(now);
    final yesterday = today.subtract(const Duration(days: 1));

    if (d == today) return 'Today';
    if (d == yesterday) return 'Yesterday';

    // Same calendar week?
    final startOfWeek = today.subtract(Duration(days: (today.weekday % 7)));
    if (!d.isBefore(startOfWeek)) return 'This Week';

    // For older entries, show concrete date for clarity.
    return DateFormat.yMMMMd().format(d);
  }
}

class _HistoryTile extends StatelessWidget {
  final HistoryItem item;
  final void Function(HistoryItem item)? onTap;
  final void Function(HistoryItem item)? onLongPress;

  const _HistoryTile({
    required this.item,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(item.leadingIcon ?? Icons.history),
      title: Text(item.title),
      subtitle: Text(
        _subtitleText(item),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        DateFormat('HH:mm').format(item.timestamp),
        style: theme.textTheme.bodySmall,
      ),
      onTap: onTap == null ? null : () => onTap!(item),
      onLongPress: onLongPress == null ? null : () => onLongPress!(item),
    );
  }

  String _subtitleText(HistoryItem item) {
    final date = DateFormat.yMMMd().add_Hm().format(item.timestamp);
    if (item.subtitle == null || item.subtitle!.trim().isEmpty) return date;
    return '${item.subtitle} · $date';
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme.titleMedium;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
        child: Text(title, style: t),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  const _EmptyState({required this.message});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.history, size: 56),
            const SizedBox(height: 12),
            Text(message, style: t.titleMedium, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(
              'Your recent activity will appear here.',
              style: t.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _DismissBg extends StatelessWidget {
  const _DismissBg();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.red.withOpacity(0.15), // why: non-intrusive destructive cue
      child: const Icon(Icons.delete_outline),
    );
  }
}

List<HistoryItem> mockItemsHistory() {
  final now = DateTime.now();
  DateTime at(int daysAgo, int hour, int minute) =>
      DateTime(now.year, now.month, now.day - daysAgo, hour, minute);

  return [
    HistoryItem(
      id: '1',
      title: 'Searched: Flutter Slivers',
      subtitle: 'From mobile app',
      timestamp: at(0, 9, 12),
      leadingIcon: Icons.search,
    ),
    HistoryItem(
      id: '2',
      title: 'Opened: Design Spec v2',
      subtitle: 'Docs',
      timestamp: at(0, 8, 47),
      leadingIcon: Icons.description_outlined,
    ),
    HistoryItem(
      id: '3',
      title: 'Played: Build Podcast Ep. 120',
      subtitle: 'Spotify',
      timestamp: at(1, 21, 5),
      leadingIcon: Icons.podcasts,
    ),
    HistoryItem(
      id: '4',
      title: 'Viewed: PR #342',
      subtitle: 'GitHub',
      timestamp: at(2, 16, 30),
      leadingIcon: Icons.merge_type,
    ),
    HistoryItem(
      id: '5',
      title: 'Checked: Flight JT-120',
      subtitle: 'Travel',
      timestamp: at(5, 10, 15),
      leadingIcon: Icons.flight_takeoff,
    ),
    HistoryItem(
      id: '6',
      title: 'Opened: Q3 Report.pdf',
      subtitle: 'Downloads',
      timestamp: at(9, 14, 2),
      leadingIcon: Icons.picture_as_pdf,
    ),
    HistoryItem(
      id: '7',
      title: 'Watched: Flutter Forward',
      subtitle: 'YouTube',
      timestamp: at(9, 19, 42),
      leadingIcon: Icons.ondemand_video,
    ),
    HistoryItem(
      id: '8',
      title: 'Read: LLM Paper',
      subtitle: 'ArXiv',
      timestamp: at(15, 11, 3),
      leadingIcon: Icons.menu_book_outlined,
    ),
  ];
}
