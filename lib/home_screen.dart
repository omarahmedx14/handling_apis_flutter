import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_apis/cubit/my_cubit.dart';
import 'package:youtube_apis/cubit/result_state.dart';
import 'package:youtube_apis/network_exceptions.dart';
import 'package:youtube_apis/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User user = User();

  @override
  void initState() {
    super.initState();
    //BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    //BlocProvider.of<MyCubit>(context).emitGetUserDetails('3766');

    BlocProvider.of<MyCubit>(context).emitCreateNewUser(User(
       ));

    //BlocProvider.of<MyCubit>(context).emitDeleteUser('3653');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children: [
          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is GetAllUsers) {
          //       usersList = (state).allUsersList;
          //       return ListView.builder(
          //         shrinkWrap: true,
          //         padding: const EdgeInsets.all(8),
          //         itemCount: usersList.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return Container(
          //             height: 50,
          //             color: Colors.amber,
          //             child:
          //                 Center(child: Text(usersList[index].id.toString())),
          //           );
          //         },
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )

          BlocBuilder<MyCubit, ResultState<User>>(
            builder: (context, ResultState<User> state) {
              return state.when(
                idle: () {
                  return const Center(child: CircularProgressIndicator());
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                success: (User userData) {
                  return Container(
                    height: 50,
                    color: Colors.red,
                    child: Center(
                        child: Text(
                      userData.email.toString(),
                      style: const TextStyle(color: Colors.white),
                    )),
                  );
                },
                error: (NetworkExceptions error) {
                  return Center(
                      child: Text(NetworkExceptions.getErrorMessage(error)));
                },
              );
            },
          ),

          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is DeleteUser) {
          //       //user = (state).newUser;
          //       return Container(
          //         height: 50,
          //         color: Colors.amber,
          //         child: Center(child: Text((state).data.toString())),
          //       );
          //     } else {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //   },
          // )
        ],
      ),
    );
  }
}
