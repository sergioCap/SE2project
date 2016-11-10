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
[G1] User registers to the system

####Actors
User, system

####Flow of events
* The user accesses the registerActivity of the application on his mobile phone.
* The user fills all the fields, entering his personal data and ID cad and driving licence information.
* The user clicks the Confirm Registration button.
* The system validates entered data comparing them with those of the external system and confirms the registration.
* The system sends the password for the login on user email account and mobile phone.

####Exit conditions
The user is redirected to the loginActivity

####Exceptions
Entered data for the driving licence is not valid, the system notifies the users and suggests to enter correct data. User is not allowed to register until he enters correct or valid information.
The user is already registered

---

###Name
[G2] User logs in

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
[G8] manage personal info

#### Actors
User, System

#### Entry Conditions
The User has been logged in and decided to change the information.

#### Flow of events

* The user Click view the profile
* The user input information if user would like to update profile
* The user click Submit/Update Profile.
* The system notify user by showing a message or through email.

#### Exit conditions
The user has deleted/updated successfully.

---

### Name
[G3,G4] View available cars on the map

#### Actors
User, System

#### Entry Conditions
The user is logged in

#### Flow of events
* (it's necessary that the system knows the position of the user and send ONLY the infos about the car close to him or it sends all the cars?)
Sergio: I would suggest that the system checks user's position using GPS and shows an area around him on the map
* view a map of the area around of the user position and show a pin with the symbol of a car in each position in which is parked an available car.
* clicking on a pin, the details of that car are shown: battery level and position. A button for reserving that car is shown.
* A back button is available on the detail page (comment: is it a step of the flow?)

#### Exit conditions
The user clicks on the button to reserve a car or to the back button. 
(question: it seems to be the last step of the flow, shouldn't exit condition be the result of the flow of events considering RASD samples?)

---

### Name
[G6] User starts using a car

#### Actors
User, system

#### Entry Conditions
The user has reserved a car and has reached it within one hour after the reservation

#### Flow of events
* The user arrives close to the car and notifies the system by clicking the Unlock button
* The system verifies user position using GPS
* The system checks last registered position of the car accessing to the third part data collector
* After comparing the two positions if the difference results to be less than or equal to 10 meters the car unlocks
* The user opens and starts the car

#### Exit conditions
No exit condition?

#### Exceptions
The user is not close to the car: the system denies the access to the car and provides a message to the user asking him to get closer in order to unlock.

---

### Name
[G6] User finishes using the car

#### Actors
User, system

#### Entry Conditions
The user has started using a car

#### Flow of events
* The user parks the car, stops it and gets out of it.
* The user clicks the End button to inform the system.
* The system checks the position of the car and ensures it is in a safe parking area.
* The system locks the car and marks it as available again.

#### Exit conditions
The system shows the user informations about his last trip, such as total price, taking into account collected discounts

#### Exceptions
The user is trying to park in a non-safe parking area: the system informs the user that he can't end the reservation and has to move the car in an allowed place.

---

### Name
[G5] Allow the user to reserve a car

#### Actors
User, System

#### Entry Conditions
The user opens the detail of a car on the map

#### Flow of events
* Viewing the details of a car, the user notify that he want to reserve that car
* The system checks if the car is still available
* The system marks that car as unavailable and start the countdown.
* On the user application sees the countdown, and he can notify that he want to release the car, or that he arrived close to the car and he want to open it. The car position is still shown.

#### Exit conditions
Countdown starts

#### Exceptions
When the user notify he want to reserve that car, if it is no longer available a message
is shown on the user application.

---
### Name
[G7] Cancel a reservation

#### Actors
User, System

#### Entry Conditions
The user view the details of the car he reserved and the countdown

#### Flow of events
* The user notify that he want to cancel the reservation of that car
* The system marks that car as available again and stops the countdown
* The user is notified by the system ??

#### Exit conditions
The user view the map and can reserve another car

---

###Name
[G9] Money Charging

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
The payment fails due to missing money on the credit card or blocked card. The system receives a failure message and communicates to the user a deadline for the payment and makes the user unable to reserve a car. If the user exceeds the deadline, the system bans the account forever and delegates the problem to a debt collecting company.

---

### Name
View Parking Area

#### Actors
User, System

#### Entry Conditions
User finishes using the car and is looking for a parking space

#### Flow of events
* The user can see the free car parking near his/her position throw GPS.
* The system will show some information about the position of this particular parking space. 
* The user choose one of the car parkings by clicking on them. 
* The system will show some information about the position of this particular parking space.
* The user choose one of the car parkings by clicking on them.
* The user click on the button to reserve the parking space.
* The system will change the status of this Parking as Reserved.

#### Exit conditions
The user clicks on the button to reserve a Parking Area or to the back button.

---

### Name
View Power Station

#### Actors
User, System

#### Entry Conditions
User will understand that the charging of machine is going to finish and it is neccassey to charge the machine, So the user should find a power Station.

#### Flow of events
* The user can see the nearest Power Station throw GPS.
* the system can show some information about the position of Power Station.
* The User choose one of the Power station.
* The user click on the button to reserve the Power Station.
* The system will change the status of this Parking as Reserved.

#### Exit conditions
The user clicks on the button to reserve a Power Station or to the back button.

---

###Name
System provides information for money saving mode

####Actors
System, user

####Entry Conditions
The user has entered the car and chosen to use the money saving mode.

####Flow of events
* The system asks the user for the final destination.
* The user enters the address.
* The system checks entered address and looks for free power plugs in close stations (taking into account the distribution of cars in the city).
* The system shows the result to the user asking for confirmation.
* The user accepts to park in the station selected by the system.
* The system reserves the free power plug informing an external data collecting system.
* The system provides the address and number of the slot reserved for the power supply.

####Exit conditions
The user sees informations and directions to the slot and the power station.

####Exceptions
The address entered by the user does not exist or is out of the area: the system informs the user of the error and suggests to retry.
The user refuses to park in the suggested station: the system suggests to retry the search to find a better result.
No free slots available: the system informs the user that there are no charging slots available, so it suggests the user to retry later.

---

