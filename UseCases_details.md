##Use Cases

###Name
User registers to the system

####Actors
User, system

####Flow of events
* The user accesses the registerActivity of the application on his mobile phone.
* The user fills all the fields, entering his personal data and ID cad and driving licence informations.
* The user clicks the Confirm Registration button.
* The system validates entered data comparing them with those of the external system and confirms the registration.
* The system sends the password for the login on user email account and mobile phone.

####Exit conditions
The user is redirected to the loginActivity

####Exceptions
Entered data for the driving licence is not valid, the system notifies the users and suggests to enter correct data. User is not allowed to register until he enters correcct or valid informations.

---

###Name
User logs in

####Actors
User, system

####Entry Conditions
The user must be already registered to the system

####Flow of events
* The user opens the loginActivity and enters login data.
* The system validates entered data.

####Exit conditions
The user has access to the map showing available cars in his area.

####Exceptions
The user account does not exist, the system notifies the user and suggests to register in case he has not.

---

###Name
The System Picks up money from the client credit card

####Participating actors
System

####Entry Conditions
The system has calculated the amount that the user have to pay

####Flow of events

####Exit contitions
The system has received a message from the external payment system that the payment has been completed successfully.

####Exception
The payment fails due to missing money on the credit card or blocked card. The system receive a failure message and communicate to the user a deadline for the payment and makes the user unable to reserve a car. If the user exceed the deadline, the system ban the account forever and delegate the problem to a debt collecting company.

####Special Requirements
