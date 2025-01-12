import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils.dart';
import '../bloc/watchlist_bloc.dart';
import '../bloc/watchlist_event.dart';
import '../bloc/watchlist_state.dart';
import 'search_screen.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen>
    with SingleTickerProviderStateMixin {
  int selectedTabIndex = 0;
  final List<String> watchlistGroups = [
    "NIFTY",
    "BANKNIFTY",
    "SENSEX",
    "WATCHLIST4"
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    context.read<WatchlistBloc>().add(LoadWatchlistEvent(watchlistGroups[0]));
    _tabController = TabController(length: watchlistGroups.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController to prevent memory leaks
    super.dispose();
  }

  void onTabChanged(int index) {
    setState(() {
      selectedTabIndex = index;
    });
    context
        .read<WatchlistBloc>()
        .add(LoadWatchlistEvent(watchlistGroups[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Watchlist",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.colorize,
                color: Colors.white,
              ))
        ],
        bottom: TabBar(
          onTap: onTabChanged,
          controller: _tabController,
          isScrollable: true,
          indicatorColor: primaryColor,
          tabs: watchlistGroups
              .map((group) => Tab(
                    text: group,
                  ))
              .toList(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              enabled: true,
              readOnly: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()));
              },
              decoration: InputDecoration(
                hintText: "Search & Add",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(
                  Icons.grid_on_outlined,
                  color: primaryColor,
                ),
                filled: true,
                fillColor: Colors.grey[600],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<WatchlistBloc, WatchlistState>(
              builder: (context, state) {
                if (state is WatchlistLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is WatchlistLoaded) {
                  if (state.items.isNotEmpty) {
                    return Column(children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final stock = state.items[index];
                          return ListTile(
                              title: Text(stock.symbol),
                              subtitle: Row(
                                children: [
                                  Text(stock.exchange),
                                  stock.stocks != 0
                                      ? Row(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10.0, right: 2),
                                              child: Icon(
                                                Icons.add_chart,
                                                size: 12,
                                              ),
                                            ),
                                            Text(stock.stocks!.toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                )),
                                          ],
                                        )
                                      : const Offstage(),
                                ],
                              ),
                              trailing: SizedBox(
                                width: 80,
                                // height: 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      stock.price.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: stock.isPositive
                                            ? primaryColor
                                            : errorColor,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          stock.isPositive
                                              ? Icons.arrow_upward
                                              : Icons.arrow_downward,
                                          size: 14,
                                          color: stock.isPositive
                                              ? primaryColor
                                              : errorColor,
                                        ),
                                        Text(
                                          stock.percentage.toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: stock.isPositive
                                                ? primaryColor
                                                : errorColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text("${state.items.length} / 50 Stocks"),
                      ),
                      state.items.length <= 50
                          ? Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.note_alt_rounded,
                                            color: primaryColor,
                                          ),
                                          Text(
                                            "Edit Watchlist",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          )
                                        ])),
                              ),
                            )
                          : const Offstage()
                    ]);
                  } else {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "No Stocks",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.note_alt_rounded,
                                        color: primaryColor,
                                      ),
                                      Text(
                                        "Edit Watchlist",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      )
                                    ])),
                          ),
                        )
                      ],
                    ));
                  }
                } else if (state is WatchlistError) {
                  return Center(child: Text(state.message));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
