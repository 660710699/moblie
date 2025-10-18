import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phoneNumber;
  final String imgUrl;
  const CustomProfile({
    super.key,
    required this.name,
    required this.position,
    required this.email,
    required this.phoneNumber,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 600,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              'https://scontent.fbkk2-8.fna.fbcdn.net/v/t39.30808-6/491955550_1412557366569205_4407016226046142557_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeH7Db5uWHKyF4__husyLikY2B0LUdHsRdPYHQtR0exF028aTNON_1QtzHM1a13OgVSXHhTuawGofTSm5YrQ4per&_nc_ohc=JFJVJTlgBn4Q7kNvwHk_CBV&_nc_oc=AdkKFw3s7FpOXffZNxqiG7mnp5HVoyyP5FOqq1oUJ0TyvsV7NyaxBW4sL884PIkJMn8&_nc_zt=23&_nc_ht=scontent.fbkk2-8.fna&_nc_gid=8fkW4hZTtOH_l3YxAuPikg&oh=00_AfewXKeDguuV7ae_536FjF_01T80fK4P5dn5rbuV7vPMbQ&oe=68F8D344',
              fit: BoxFit.fill,
            ),
          ),

          Text(
            name,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            position,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email, color: Colors.redAccent, size: 22),
              SizedBox(width: 10),
              Text(
                email,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone, color: Colors.green, size: 22),
              SizedBox(width: 10),
              Text(
                phoneNumber,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
