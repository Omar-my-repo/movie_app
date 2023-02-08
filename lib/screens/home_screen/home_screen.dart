import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_movies_app/base.dart';
import 'package:route_movies_app/screens/home_screen/home_vm.dart';
import 'package:route_movies_app/screens/home_screen/new_released_section.dart';
import 'package:route_movies_app/screens/home_screen/recommended_section.dart';
import 'package:route_movies_app/screens/home_screen/shimmer_ui/newreleased_section_shimmer.dart';
import 'package:route_movies_app/screens/home_screen/shimmer_ui/top_rated_section_shimmer.dart';
import 'package:route_movies_app/screens/home_screen/top_side_section.dart';

import 'shimmer_ui/top_section_shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.getLatestMovies();
    viewModel.getPopularMovies();
    viewModel.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        viewModel.getLatestMovies();
      },
      child: ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Container(
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<HomeViewModel>(
                  builder: (_, homeViewModel, __) {
                    if (homeViewModel.topSectionErrorMessage != null) {
                      return const Center(
                        child: Text('SomeThingWentWrong, check your connction'),
                      );
                    }
                    if (homeViewModel.topSectionMovie == null) {
                      //معناه ان الليست لسه بتلوود
                      return const TopSectionShimmer();
                    } else {
                      return TopSideSection(homeViewModel.topSectionMovie!);
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Released',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const SizedBox(height: 10),
                      Consumer<HomeViewModel>(builder: (_, homeViewModel, __) {
                        if (homeViewModel.newReleasedErrorMessage != null) {
                          return const Center(
                            child: Text(
                                'SomeThing Went Wrong, check your connction'),
                          );
                        }
                        if (homeViewModel.newReleasedMovies == null) {
                          //معناه ان الليست لسه بتلوود
                          return const NewReleasedSectionShimmer();
                        }
                        return NewReleasdSection(
                            homeViewModel.newReleasedMovies!);
                      }),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommended',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const SizedBox(height: 10),
                      Consumer<HomeViewModel>(builder: (_, homeViewModel, __) {
                        if (homeViewModel.recommendedSectionErrorMessage !=
                            null) {
                          return const Center(
                            child: Text(
                                'SomeThing Went Wrong, check your connction'),
                          );
                        } else if (homeViewModel.recommendedSectionMovies ==
                            null) {
                          return const TopRatedSectionShimmer();
                        }
                        return RecommendedSection(
                            homeViewModel.recommendedSectionMovies!);
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}
