import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/cfp/presentation/widgets/cfp_container.dart';
import 'package:flutter_conf_colombia/features/contact/presentation/widgets/contact_container.dart';
import 'package:flutter_conf_colombia/features/home/data/models/home_section.dart';
import 'package:flutter_conf_colombia/features/home/data/models/tab_section.dart';
import 'package:flutter_conf_colombia/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/custom_tab_controller.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/event_features_container.dart';
import 'package:flutter_conf_colombia/features/home/presentation/widgets/home_container.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/footer.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/header.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/widgets/mobile_drawer.dart';
import 'package:flutter_conf_colombia/features/schedule/presentation/widgets/schedule_container.dart';
import 'package:flutter_conf_colombia/features/speakers/presentation/widgets/speakers_container.dart';
import 'package:flutter_conf_colombia/features/tickets/presentation/widgets/tickets_container.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late CustomTabController tabController;
  late ScrollController scrollController;
  late List<HomeSection> sections;
  late List<TabSection> tabSections;

  bool isScrolled = false;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
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
  }

  void setupSections() {
    sections = ref.watch(homeSectionsProvider);

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
  }

  @override
  Widget build(BuildContext context) {

    setupSections();

    final isMobile = getValueForScreenType(
      context: context,
      mobile: true,
      tablet: false,
    );

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              title: SvgPicture.asset('${Constants.imagesPath}/flutter_logo_color.svg',
                width: 40, height: 40,
              )
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
              const Footer(),
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
      curve: Curves.easeInOut,
    );

    Future.delayed(duration, () {
      isScrolled = false;
    });
  }
}
