##Use Cases

###Schema
### Name

#### Actors

#### Entry Conditions

#### Flow of events

#### Exit conditions

#### Exceptions
---

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

### Name
View available cars on the map

#### Actors
User, System

#### Entry Conditions
The user is logged in

#### Flow of events
* (it's necessary that the system knows the position of the user and send ONLY the infos about the car close to him or it sends all the cars?)
* view a map of the area around of the user position and show a pin with the symbol of a car in each position in which is parked an available car.
* clicking on a pin, the details of that cars are showen: battery level and position. A button for reserving that car is showen.
* A back button is available on the detail page

#### Exit conditions
The user click on the button to reserve a car or to the back button.

---

### Name
Allow the user to reserve a car

#### Actors
User, System

#### Entry Conditions
The user open the detail of a car on the map

#### Flow of events
* In the detail of a car, the user press the button to reserve that car
* The system mark that car as unavailable and start the countdown.
* On the user application a new screen appear that shows the countdown, a button to release the car, a button to open the car. The car position is still shown.

#### Exit conditions

#### Exceptions

---

###Name
Money Charging

####Participating actors
System

####Entry Conditions
The client has parked the car.

####Flow of events
* The system checks the cars gps and energy informations
* The system calculates the amount and apply the discount
* The system tell the payment system to Picks up the final amount of money from the client credit card
* The system communicate the final amount to the client

####Exit contitions
The system has received a message from the external payment system that the payment has been completed successfully.

####Exception
The payment fails due to missing money on the credit card or blocked card. The system receive a failure message and communicate to the user a deadline for the payment and makes the user unable to reserve a car. If the user exceed the deadline, the system ban the account forever and delegate the problem to a debt collecting company.

