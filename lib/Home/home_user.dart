import 'package:pitch_project/components/user.dart';
import 'package:flutter/material.dart';


class HomeUser extends StatefulWidget {
  
  const HomeUser({Key? key}) : super(key: key);

  @override
  State<HomeUser> createState() => _HomePageState();
}

class _HomePageState extends State<HomeUser> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController encryptedPasswordController = TextEditingController();
  TextEditingController emailVerificationTokenController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController emailVerificationStatusController = TextEditingController();
  List<User> contacts = List.empty(growable: true);


  int selectedIndex = -1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User list'),
      ),
      
      body: SingleChildScrollView(
        child:GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            FocusScope.of(context).unfocus();
          },

        child: Container(
          width: double.infinity,
          height: 1000,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),

             TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),


            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),


            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: encryptedPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                  hintText: 'Encrypted password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),


                TextField(
              controller: emailVerificationTokenController,
              decoration: const InputDecoration(
                  hintText: 'Email Verification',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),

              TextField(
              controller: emailVerificationStatusController,
              decoration: const InputDecoration(
                  hintText: 'Email verification',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ))),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String firstName = firstNameController.text.trim();
                      String lastName = lastNameController.text.trim();
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();
                      String encryptedPassword = encryptedPasswordController.text.trim();
                      String emailVerificationToken = emailVerificationTokenController.text.trim();
                      String description = descriptionController.text.trim();
                      bool emailVerificationStatus = emailVerificationStatusController.text.trim()=='true';
                      
                      if (firstName.isNotEmpty && lastName.isNotEmpty && email.isNotEmpty
                      && password.isNotEmpty && encryptedPassword.isNotEmpty && emailVerificationToken.isNotEmpty
                      && description.isNotEmpty && passwordController.text == encryptedPasswordController.text
                      && emailController.text == emailVerificationTokenController.text)  {
                        setState(() {
                          firstNameController.text = '';
                          lastNameController.text = '';
                          emailController.text = '';
                          passwordController.text = '';
                          encryptedPasswordController.text = '';
                          emailVerificationTokenController.text='';
                          descriptionController.text='';
                          emailVerificationStatusController.text='';
                          

                
                          contacts.add (User( userId:'',firstName: firstName, lastName:lastName, email:email,
                          password:password,encryptedPassword:encryptedPassword,emailVerificationToken:emailVerificationToken,
                          description: description ,emailVerificationStatus:emailVerificationStatus
                           ));
                        });
                      }else if(firstName.isEmpty || lastName.isEmpty || email.isEmpty
                      || password.isEmpty || encryptedPassword.isEmpty || emailVerificationToken.isEmpty
                      || description.isEmpty){

                             showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text('you should insert all the data'),
                           actions: [
                           TextButton(
                           onPressed: () => Navigator.pop(context),
                           child: const Text('OK'),
                            ),
                           ],
                          ),
                        );

                      }
                      else{
                         showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: const Text('the password or the email are not matched'),
                           actions: [
                           TextButton(
                           onPressed: () => Navigator.pop(context),
                           child: const Text('OK'),
                            ),
                            ],
                          ),
                         );
                      }
                      //
                    },
                    child: const Text('Save')),
                ElevatedButton(
                    onPressed: () {
                      //
                      String firstName = firstNameController.text.trim();
                      String lastName = lastNameController.text.trim();
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();
                      String encryptedPassword = encryptedPasswordController.text.trim();
                      String emailVerificationToken = emailVerificationTokenController.text.trim();
                      String description = descriptionController.text.trim();
                      bool emailVerificationStatus = emailVerificationStatusController.text.trim() == 'true';

                      if (firstName.isNotEmpty && lastName.isNotEmpty && email.isNotEmpty && selectedIndex != -1
                      && password.isNotEmpty && encryptedPassword.isNotEmpty && emailVerificationToken.isNotEmpty) {
                        setState(() {
                          firstNameController.text = '';
                          lastNameController.text = '';
                          emailController.text = '';
                          passwordController.text = '';
                          encryptedPasswordController.text = '';
                          emailVerificationTokenController.text='';
                          descriptionController.text='';
                          emailVerificationStatusController.text='';
                          
                          contacts[selectedIndex].firstName = firstName;
                          contacts[selectedIndex].lastName = lastName;
                          contacts[selectedIndex].email = email;
                          contacts[selectedIndex].password = password;
                          contacts[selectedIndex].encryptedPassword = encryptedPassword;
                          contacts[selectedIndex].emailVerificationToken = emailVerificationToken;
                          contacts[selectedIndex].description = description;
                          contacts[selectedIndex].emailVerificationStatus = emailVerificationStatus;
                          selectedIndex = -1;
                        });
                      }
                      //
                    },
                    child: const Text('Update')),
              ],
            ),
            const SizedBox(height: 10),
            contacts.isEmpty
                ? const Text(
                    'No User yet..',
                    style: TextStyle(fontSize: 22),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
      ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        
        
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'first name:${contacts[index].firstName}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('last name:${contacts[index].lastName}',),
            //Text('email: ${contacts[index].email}',),
            //Text('password: ${contacts[index].password}',),
            //Text('encrypted password: ${contacts[index].encryptedPassword}',),
            Text('email verification: ${contacts[index].emailVerificationToken}',),
            Text('description: ${contacts[index].description }',),
            Text('email status: ${contacts[index].emailVerificationStatus ? 'true':'false' }',),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    firstNameController.text = contacts[index].firstName;
                    lastNameController.text = contacts[index].lastName;
                    emailController.text = contacts[index].email;
                    passwordController.text = contacts[index].password; 
                    encryptedPasswordController.text = contacts[index].encryptedPassword;
                    emailVerificationTokenController.text = contacts[index].emailVerificationToken;
                    descriptionController.text = contacts[index].description;
                    emailVerificationStatusController.text = contacts[index].emailVerificationStatus.toString();
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
  
}
