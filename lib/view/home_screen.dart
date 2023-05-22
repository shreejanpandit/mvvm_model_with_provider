import 'package:flutter/material.dart';
import 'package:mvvm_practisce_with_provider/data/response/status.dart';
import 'package:mvvm_practisce_with_provider/utils/routes/routes_name.dart';
import 'package:mvvm_practisce_with_provider/utils/utils.dart';
import 'package:mvvm_practisce_with_provider/view_model/home_view_model.dart';
import 'package:mvvm_practisce_with_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchMoviesListApi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false, actions: [
          Center(
            child: InkWell(
                onTap: () {
                  userPreference.removeUser().then((value) {
                    Utils.snackBar('Logout sucessful', context);

                    Navigator.pushNamed(context, RoutesName.login);
                  });
                },
                child: const Text('Logout')),
          ),
        ]),
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => homeViewModel,
          child: Consumer<HomeViewModel>(builder: (context, value, child) {
            print(value.moviesList.status.toString());
            switch (value.moviesList.status) {
              case Status.LOADING:
                return Center(
                    child: const CircularProgressIndicator.adaptive());
              case Status.ERROR:
                return Text(value.moviesList.message.toString());
              case Status.COMPLETED:
                return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                            value.moviesList.data!.movies![index].posterurl
                                .toString(),
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.error,
                                color: Colors.red,
                              );
                            },
                          ),
                          title: Text(value
                              .moviesList.data!.movies![index].title
                              .toString()),
                          subtitle: Text(value
                              .moviesList.data!.movies![index].year
                              .toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(Utils.averageRating(value
                                      .moviesList.data!.movies![index].ratings!)
                                  .toString()),
                              Icon(
                                Icons.star_border,
                                color: Colors.yellow,
                              )
                            ],
                          ),
                        ),
                      );
                    }));
              default:
            }
            return Container();
          }),
        ));
  }
}
