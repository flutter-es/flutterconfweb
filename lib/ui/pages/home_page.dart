import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/ui/entities/home_section.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/cfp_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/contact_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/header.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/home_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/schedule_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/speakers_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/tickets_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;
  late List<HomeSection> sections;

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

    tabController = TabController(
      length: sections.length,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          Header(
            tabController: tabController,
            sections: sections,
            onTap: (index) {
              var sumBefore = 0.0;
              for (var i = 0; i < index; i++) {
                final section = sections[index];
                sumBefore = sumBefore + section.size;
              }

              scrollController.animateTo(
                sumBefore,
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ...sections.map((e) => e.builder(context)),
            ]),
          )
        ],
      ),
    );
  }
}
