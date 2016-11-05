##Use Cases

###Name
User registers to the system

####Actors
User

####Entry conditions
None

####Flow of events
* The user accesses the registerActivity of the application on his mobile phone.
* The user fills all the fields, entering his personal data and ID cad and driving licence informations.
* The user clicks the Confirm Registration button
* The system validates entered data comparing them with those of the external system and confirms the registration
* The system sends the password for the login on user email account and mobile phone

####Exit conditions
The user is redirected to the loginActivity

####Exceptions
The informations concerning driving licence and user names 

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
