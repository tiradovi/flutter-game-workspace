import 'package:flutter/material.dart';
import 'package:game_workspace/models/game_item.dart';
import 'package:game_workspace/models/user.dart';
import 'package:game_workspace/services/user_service.dart';
import 'package:go_router/go_router.dart';

class UserListScreen extends StatefulWidget {
  final String gameId;
  final GameItem? gameItem;

  const UserListScreen({
    super.key,
    required this.gameId,
    this.gameItem,
  });

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    setState(() => isLoading = true);
    try {
      final result = await UserService.getAllUsers();

      setState(() {
        users = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("오류 $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("사용자 목록"), backgroundColor: Colors.black12),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : users.isEmpty
                ? Center(child: Text("사용자가 없습니다."))
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Card(
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(user.profileImageUrl ?? ''),
                            ),
                            title: Text(user.userName),
                            subtitle: Text(user.email),
                            trailing: Icon(Icons.arrow_forward_ios),
                            onTap: () => context.push('/users/${user.userId}',
                                extra: user),
                          ));
                    }));
  }
}
