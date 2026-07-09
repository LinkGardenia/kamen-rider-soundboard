import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/tv_series.dart';
import '../models/rider.dart';
import '../theme/theme_manager.dart';
import '../data/sound_repository.dart';
import '../screens/system/rider_list_screen.dart';
import '../screens/system/form_select_screen.dart';

class RiderSearchBar extends StatefulWidget {
  const RiderSearchBar({super.key});
  @override State<RiderSearchBar> createState() => _RiderSearchBarState();
}

class _RiderSearchBarState extends State<RiderSearchBar> {
  final _ctrl = TextEditingController(), _fn = FocusNode();
  List<dynamic> _results = []; bool _show = false;

  void _search(String q) {
    if (q.trim().isEmpty) { setState(() { _results = []; _show = false; }); return; }
    setState(() { _results = SoundRepository.search(q); _show = true; });
  }

  @override void dispose() { _ctrl.dispose(); _fn.dispose(); super.dispose(); }

  @override Widget build(BuildContext context) {
    final theme = context.watch<ThemeManager>().currentTheme;
    return Column(children: [
      Container(decoration: BoxDecoration(color: theme.colors.surface, borderRadius: BorderRadius.circular(30),
        border: Border.all(color: _show ? theme.colors.accent : theme.colors.accent.withOpacity(0.3), width: 2.5),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), offset: const Offset(3, 3), blurRadius: 0)]),
        child: TextField(controller: _ctrl, focusNode: _fn, onChanged: _search,
          style: TextStyle(fontFamily: theme.typography.accentFontFamily, color: theme.colors.textPrimary, fontSize: 16),
          decoration: InputDecoration(hintText: '搜索TV系列或假面骑士...',
            hintStyle: TextStyle(color: theme.colors.textSecondary.withOpacity(0.5), fontSize: 14),
            prefixIcon: Icon(Icons.search, color: theme.colors.accent),
            suffixIcon: _ctrl.text.isNotEmpty ? IconButton(icon: Icon(Icons.clear, color: theme.colors.textSecondary),
              onPressed: () { _ctrl.clear(); _search(''); _fn.unfocus(); }) : null,
            border: InputBorder.none, contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14)))),
      if (_show && _results.isNotEmpty)
        Container(margin: const EdgeInsets.only(top: 8), decoration: BoxDecoration(color: theme.colors.surface,
          borderRadius: BorderRadius.circular(12), border: Border.all(color: theme.colors.accent.withOpacity(0.3), width: 2)),
          constraints: const BoxConstraints(maxHeight: 300),
          child: ListView.builder(shrinkWrap: true, itemCount: _results.length, itemBuilder: (ctx, i) {
            final item = _results[i];
            final isSeries = item is TVSeries;
            final cHex = isSeries ? (item as TVSeries).themeColorHex : (item as KamenRider).colorHex;
            final name = isSeries ? (item as TVSeries).title : (item as KamenRider).name;
            final sub = isSeries ? '${(item as TVSeries).yearRange} · ${item.era}' : (item as KamenRider).seriesId;
            return ListTile(
              leading: Icon(isSeries ? Icons.tv : Icons.person, color: Color(int.parse('0xFF${cHex.substring(1)}'))),
              title: Text(name, style: TextStyle(fontFamily: theme.typography.accentFontFamily, color: theme.colors.textPrimary, fontWeight: FontWeight.bold)),
              subtitle: Text(sub, style: TextStyle(color: theme.colors.textSecondary, fontSize: 12)),
              onTap: () { _fn.unfocus();
                if (isSeries) Navigator.push(context, MaterialPageRoute(builder: (_) => RiderListScreen(series: item as TVSeries)));
                else Navigator.push(context, MaterialPageRoute(builder: (_) => FormSelectScreen(rider: item as KamenRider)));
              });
          })),
    ]);
  }
}
