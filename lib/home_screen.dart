import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_search/bloc/Search_Bloc/search_bloc.dart';
import 'package:flutter_bloc_search/bloc/Search_Bloc/search_event.dart';
import 'package:flutter_bloc_search/bloc/Search_Bloc/search_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){
                  context.read<SearchBloc>().add(SearchWordEvent(word: value));
                },
                decoration: InputDecoration(
                    labelText: "Search",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.pink, width: 2),
                        borderRadius: BorderRadius.circular(20))),
              ),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context,state) {
                    if(state is SearchLoadedState)
                    {
                    return ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.loadedWords[index]),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 16,
                          );
                        },
                        itemCount: state.loadedWords.length);
                  }
                    return Container();
                }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
