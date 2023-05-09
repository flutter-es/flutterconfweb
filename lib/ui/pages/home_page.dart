import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_conf_colombia/ui/entities/home_section.dart';
import 'package:flutter_conf_colombia/ui/entities/tab_section.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/cfp_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/contact_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/event_features_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/footer.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/header.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/home_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/mobile_drawer.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/schedule_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/speakers_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/tickets_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/utils/custom_tab_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late CustomTabController tabController;
  late ScrollController scrollController;
  late List<HomeSection> sections;
  late List<TabSection> tabSections;

  bool isScrolled = false;

  @override
  void initState() {
    scrollController = ScrollController();

    sections = [
      HomeSection(
        builder: (_) => const HomeContainer(),
        size: HomeContainer.height,
        title: HomeContainer.title,
      ),
      HomeSection(
        builder: (_) => const CfpContainer(),
        size: CfpContainer.height,
        title: CfpContainer.title,
      ),
      HomeSection(
        builder: (_) => const EventFeaturesContainer(),
        size: EventFeaturesContainer.height,
        title: EventFeaturesContainer.title,
      ),
      HomeSection(
        builder: (_) => const TicketsContainer(),
        size: TicketsContainer.height,
        title: TicketsContainer.title,
      ),
      HomeSection(
        builder: (_) => const SpeakersContainer(),
        size: SpeakersContainer.height,
        title: SpeakersContainer.title,
      ),
      HomeSection(
        builder: (_) => const ScheduleContainer(),
        size: ScheduleContainer.height,
        title: ScheduleContainer.title,
      ),
      HomeSection(
        builder: (_) => const ContactContainer(),
        size: ContactContainer.height,
        title: ContactContainer.title,
      ),
    ];

    tabController = CustomTabController(
      length: sections.length,
      vsync: this,
    );

    tabSections = <TabSection>[];

    var sumBefore = 0.0;
    for (var i = 0; i < sections.length; i++) {
      final section = sections[i];

      tabSections.add(
        TabSection(
          index: i,
          start: sumBefore,
          end: sumBefore + section.size,
        ),
      );

      sumBefore = sumBefore + section.size;
    }

    scrollController.addListener(() {
      if (isScrolled) {
        return;
      }

      final position = scrollController.offset;

      for (final section in tabSections) {
        if (position < section.end && position >= section.start) {
          tabController.animateTo(section.index);
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = getValueForScreenType(
      context: context,
      mobile: true,
      tablet: false,
    );

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              title: Icon(FlutterConfLatamIcons.flutter),
            )
          : null,
      drawer: isMobile
          ? MobileDrawer(
              tabController: tabController.mobile(),
              sections: sections,
              onTap: (index) {
                moveSectionByIndex(index, isMobile: isMobile);
              },
            )
          : null,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          if (!isMobile)
            Header(
              tabController: tabController.build(),
              sections: sections,
              onTap: (index) {
                moveSectionByIndex(index, isMobile: isMobile);
              },
            ),
          SliverList(
            delegate: SliverChildListDelegate([
              ...sections.map((e) => e.builder(context)),
              Footer(),
            ]),
          )
        ],
      ),
    );
  }

  void moveSectionByIndex(int index, {bool isMobile = false}) {
    final section = tabSections[index];

    const duration = Duration(milliseconds: 300);

    isScrolled = true;

    final additional = isMobile //
        ? 0
        : (index == 0 ? 0 : (kToolbarHeight + kTextTabBarHeight));

    scrollController.animateTo(
      section.start + additional,
      duration: duration,
      curve: Curves.linear,
    );

    Future.delayed(duration, () {
      isScrolled = false;
    });
  }
}
