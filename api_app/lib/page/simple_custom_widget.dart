import 'package:api_app/components/custom_profile.dart';
import 'package:flutter/material.dart';

class SimpleCustomWidget extends StatefulWidget {
  const SimpleCustomWidget({super.key});

  @override
  State<SimpleCustomWidget> createState() => _SimpleCustomWidgetState();
}

class _SimpleCustomWidgetState extends State<SimpleCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom widget')),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           CustomProfile(name: 'Chanthaphat Masem', position: '660710699', email: 'masem_c@silpakorm.edu', phoneNumber: '000-000-0000', imgUrl: 'https://scontent.fbkk2-8.fna.fbcdn.net/v/t39.30808-6/491955550_1412557366569205_4407016226046142557_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeH7Db5uWHKyF4__husyLikY2B0LUdHsRdPYHQtR0exF028aTNON_1QtzHM1a13OgVSXHhTuawGofTSm5YrQ4per&_nc_ohc=JFJVJTlgBn4Q7kNvwHk_CBV&_nc_oc=AdkKFw3s7FpOXffZNxqiG7mnp5HVoyyP5FOqq1oUJ0TyvsV7NyaxBW4sL884PIkJMn8&_nc_zt=23&_nc_ht=scontent.fbkk2-8.fna&_nc_gid=8fkW4hZTtOH_l3YxAuPikg&oh=00_AfewXKeDguuV7ae_536FjF_01T80fK4P5dn5rbuV7vPMbQ&oe=68F8D344')
          ],
        ),
      ),
    );
  }
}
