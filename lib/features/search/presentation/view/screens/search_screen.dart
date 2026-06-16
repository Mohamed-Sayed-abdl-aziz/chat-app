import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/features/chat/presentation/view/screens/chat_screen.dart';
import 'package:chat_app/features/home/presentation/view/widgets/empty_freinds_widget.dart';
import 'package:chat_app/features/home/presentation/view/widgets/freind_container_widget.dart';
import 'package:chat_app/features/search/domain/use_caes/search_use_case.dart';
import 'package:chat_app/features/search/presentation/view_model/searchcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String route = "SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchCubit? _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = SearchCubit(useCase: searchUseCaseInject());
  }

  @override
  void dispose() {
    _cubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_rounded, color: AppColors.secundryColor),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/scholar.png", width: 50, height: 50),
            Text(
              "Chat",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (query) {
                _cubit?.searchByName(query);
              },
              decoration: InputDecoration(
                hintText: "search on your friends",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              bloc: _cubit,
              builder: (context, state) {
                if (state is SearchLoadinState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SearchEmptyState) {
                  return EmptyFreinds();
                } else if (state is SearchSuccessState) {
                  return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return FriendContainerWidget(
                        friendName: state.users[index].name,
                        lastMessage: state.users[index].phoneNumber,
                        time: "",
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ChatScreen.route,
                            arguments: state.users[index],
                          );
                        },
                      );
                    },
                  );
                } else if (state is SearchErrorState) {
                  return Center(
                    child: Text(
                      state.error,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
          // EmptyFreinds(),
        ],
      ),
    );
  }
}
