import 'package:flutter/material.dart';
import 'package:presentation/widgets/search_bar.dart';

class FlexibleSearchHeader extends StatefulWidget {
  final Function(double) heightCallback;
  final TextEditingController controller;
  final List<String> sections;
  final String selectedSection;

  const FlexibleSearchHeader({
    Key? key,
    required this.sections,
    required this.controller,
    required this.selectedSection,
    required this.heightCallback,
  }) : super(key: key);

  @override
  State<FlexibleSearchHeader> createState() => _FlexibleSearchHeaderState();
}

class _FlexibleSearchHeaderState extends State<FlexibleSearchHeader> {
  late String selected;
  @override
  void initState() {
    selected = widget.selectedSection;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double expandedHeight = 464;
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        collapsedHeight: 188,
        expandedHeight: expandedHeight,
        pinned: true,
        primary: true,
        leading: const SizedBox(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        forceElevated: false,
        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            widget.heightCallback(constraints.constrainHeight());
            return Container(
              width: double.infinity,
              height: expandedHeight,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: constraints.constrainHeight() < 230
                    ? Colors.black
                    : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: constraints.constrainHeight() < 230
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.end,
                children: [
                  SizedBox(
                      height: constraints.constrainHeight() < 230
                          ? MediaQuery.of(context).padding.top
                          : 78),
                  Container(
                    height: constraints.constrainHeight() < 230 ? 100 : null,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          iconSize: 34,
                          padding: const EdgeInsets.all(0),
                          splashRadius: 34,
                          alignment: Alignment.centerLeft,
                          icon: Icon(
                            Icons.menu,
                            size: 34,
                            color: constraints.constrainHeight() < 230
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(width: 25),
                        if (constraints.constrainHeight() < 230)
                          Flexible(
                            child: SearchBar(
                                lightTheme: true,
                                controller: widget.controller,
                                onPressedFilter: () {}),
                          )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (constraints.constrainHeight() > 470)
                          const SizedBox(height: 50),
                        if (constraints.constrainHeight() > 415) ...[
                          const Text(
                            "Discover",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "News from all over the world",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                        if (constraints.constrainHeight() > 390)
                          const SizedBox(height: 40),
                        if (constraints.constrainHeight() > 380) ...[
                          SearchBar(
                            controller: widget.controller,
                            onPressedFilter: () {},
                          ),
                        ],
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.only(top: 30),
                    height: 88,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: widget.sections.length,
                      itemBuilder: (context, index) {
                        return _buildSectionItem(
                            title: widget.sections[index], index: index);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionItem({
    required String title,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = title;
        });
      },
      child: IntrinsicWidth(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: index == 0 ? 0 : 20),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color:
                      title == selected ? Colors.black : Colors.grey.shade400,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              height: 3,
              color: index == 0 && title == selected
                  ? Colors.black
                  : Colors.grey.shade400,
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: double.infinity,
                height: 3,
                color: title == selected ? Colors.black : Colors.grey.shade400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
