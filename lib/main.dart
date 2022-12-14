import 'package:fluent_ui/fluent_ui.dart';
import 'incidents_manager.dart';
import 'theme_config.dart';

void main() {
  // runs the fastim application.
  runApp(const FastIMApp());
}

/// root widget that hosts the entire fastim application.
/// in the same app or ticket history viewer as standalone
// TODO: right now I want a sequence diagram viewer and incident management
class FastIMApp extends StatelessWidget {
  const FastIMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
        // prefer dark theme always.
        themeMode: ThemeMode.dark,
        // theme data to use for dark theme.
        darkTheme: darkThemeData,
        // hide the debug banner on top right
        debugShowCheckedModeBanner: false,
        // application's title
        title: 'FastIM',

        // the main navigation view, holds different subapps
        // sequence viewer, incidents manager, standalone ticket history viewer.
        home: NavigationView(
          pane: NavigationPane(
            selected: 0,
            onChanged: (i) {},
            displayMode: PaneDisplayMode.compact,
            items: [
              PaneItem(
                  icon: const Icon(FluentIcons.issue_tracking),
                  title: const Text('Incidents'),
                  infoBadge: const InfoBadge(source: Text('8')),
                  body: const IncidentsManager()),
            ],
          ),
        ));
  }
}
