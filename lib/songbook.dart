import 'package:flutter/material.dart';
import 'package:thandri_sannidhi/showdetails.dart';
import 'package:thandri_sannidhi/song.dart';

class SongBookScreen extends StatelessWidget {
  SongBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 128, 0, 128),
        title: const Text('Song Book'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // const TextField(
          //   // onChanged: () {

          //   // },
          //   decoration: InputDecoration(
          //     labelText: 'Search',
          //     suffixIcon: Icon(
          //       Icons.search,
          //       color: Color.fromARGB(255, 128, 0, 128),
          //     ),
          //   ),
          // ),
          Expanded(
            child: ListView.separated(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color.fromARGB(255, 128, 0, 128),
                  ),
                  title: Text(
                    songs[index].name,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 18),
                  ),
                  subtitle: Text(
                    songs[index].albumname,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 139, 110, 110)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShowDetails(index: index)));
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
