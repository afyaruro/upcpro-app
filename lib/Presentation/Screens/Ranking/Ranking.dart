import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RankingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rankingData = [
    {
      "name": "Juan Pérez",
      "score": 950,
      "position": 1,
      "profileImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4RT3oqqg401DOLcCeP73YUuqtflsxp99waA&s"
    },
    {
      "name": "Ana Gómez",
      "score": 900,
      "position": 2,
      "profileImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROLSPusqd15b1i4La-iaVg-dawa0nZibdrCQ&s"
    },
     {
      "name": "Carlos López",
      "score": 850,
      "position": 3,
      "profileImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGT8OYmn04iCF2mbgFjKALGWTg2ipgYp4x0A&s"
    },
    {
      "name": "María Sánchez",
      "score": 800,
      "position": 4,
      "profileImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAboyCmArPxbW8rOU6NKGEfdDyT-M_2PNLXw&s"
    },
    {
      "name": "Luis Torres",
      "score": 750,
      "position": 5,
      "profileImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTw-S6UJ10y6n2SRGW2EGT5QPvmyfIW-CwhQ&s"
    },
  ];

  RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 245, 248),
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: rankingData.length,
              itemBuilder: (context, index) {
                final data = rankingData[index];
                return _buildRankingCard(data);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 180,
          color:  Colors.lime,
        ),
        Column(
          children: const [
            Icon(Icons.workspace_premium_rounded, color: Colors.white, size: 60),
            SizedBox(height: 10),
            Text(
              "Ranking",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              "Top 10 de los mejores puntajes",
              style: TextStyle(fontSize: 16, color: Color.fromARGB(200, 255, 255, 255)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRankingCard(Map<String, dynamic> data) {
    final int position = data["position"];
    final bool isTopThree = position <= 3;
    final List<Color> badgeColors = [
      const Color.fromARGB(255, 255, 215, 0),
      const Color.fromARGB(255, 192, 192, 192),
      const Color.fromARGB(255, 205, 127, 50),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), offset: const Offset(0, 4), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: isTopThree ? badgeColors[position - 1] : const Color.fromARGB(255, 240, 240, 240),
            backgroundImage: data["profileImage"] != null && data["profileImage"].isNotEmpty
                ? NetworkImage(data["profileImage"])
                : const AssetImage("assets/default_avatar.png") as ImageProvider,
            child: data["profileImage"] == null || data["profileImage"].isEmpty
                ? Text(
                    position.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isTopThree ? Colors.white : Colors.black87,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["name"],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 50, 50, 50)),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/trophy.svg",
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(Color(0xFFFFD700), BlendMode.srcIn),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${data["score"]}",
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          if (isTopThree)
            SvgPicture.asset(
              "assets/medal-2.svg",
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(badgeColors[position - 1], BlendMode.srcIn),
            ),
        ],
      ),
    );
  }
}