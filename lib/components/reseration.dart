import 'package:flutter/material.dart';


class Reservation {
  String? selectedUser;
  String? selectedTerrain;
  DateTime date;

  Reservation(this.selectedUser, this.selectedTerrain, )
  : date=DateTime.now();
}

class UserTerrainSelectionForm extends StatefulWidget {
  @override
  _UserTerrainSelectionFormState createState() =>
      _UserTerrainSelectionFormState();
}

class _UserTerrainSelectionFormState extends State<UserTerrainSelectionForm> {
  List<Reservation> reservations = [];
  ValueNotifier<String?> selectedUser = ValueNotifier<String?>(null);
  ValueNotifier<String?> selectedTerrain = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation of Terrain'),
        
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormField(
                label: 'Select User',
                options: ['', 'User 1', 'User 2', 'User 3'],
                onChanged: (value) {
                  selectedUser.value = value;
                },
                
              ),
              FormField(
                label: 'Select Terrain',
                options: ['', 'Terrain 1', 'Terrain 2', 'Terrain 3'],
                onChanged: (value) {
                  selectedTerrain.value = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {addReservation();},
                child: Text('Add Reservation'),
              ),
              SizedBox(height: 20),
         
              SizedBox(height: 20),
              SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: reservations.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text('User: ${reservations[index].selectedUser}'),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Terrain: ${reservations[index].selectedTerrain}'),
      Text('Date: ${reservations[index].date.toString()}'),
    ],
  ),
                        ),
                        Row(
                          children: [
                            
                            
                            ElevatedButton(
                              onPressed: () {
                                updateReservation(index);
                              },
                              child: Text('Update'),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                deleteReservation(index);
                              },
                              child: Text('Delete'),
                            ),],
                        ),
                        Divider(),
                      ],
                    );},
                ),),
               ],
            ),),
         ),);
        }

  void addReservation() {
    if (selectedUser.value != null && selectedTerrain.value != null) {
      Reservation reservation =
          Reservation(selectedUser.value, selectedTerrain.value);
      setState(() {
        reservations.add(reservation);
        selectedUser.value = null;
        selectedTerrain.value = null;
      });
      getRowData(reservation);
    }
  }

  void updateReservation(int index) {
    if (selectedUser.value != null && selectedTerrain.value != null) {
      setState(() {
        reservations[index].selectedUser = selectedUser.value;
        reservations[index].selectedTerrain = selectedTerrain.value;
        selectedUser.value = null;
        selectedTerrain.value = null;
      });
    }
  }

  void deleteReservation(int index) {
    setState(() {
      reservations.removeAt(index);
    });
  }

  void getRowData(Reservation addedReservation) {
    for (Reservation addedReservation in reservations) {
      final currentDate = DateTime.now();
      print(
          'User: ${addedReservation.selectedUser}, Terrain: ${addedReservation.selectedTerrain},Date: ${addedReservation.date.toString()}');
    }
  }
}

class FormField extends StatelessWidget {
  final String label;
  final List<String> options;
  final Function(String?) onChanged;

  const FormField({
    required this.label,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: null,
          onChanged: onChanged,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
