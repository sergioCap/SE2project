###Purpose

The purpose of this document is to provide a description of the system to be developed. It specifies goals of the system, functional and non-functional requirements and assumptions, othesqr than use cases, possible scenarios and UML diagrams. Also, the system has been modeled using Alloy Analizer and the code is provided with results of the simulation.
The document is addressed to programmers involved in the developing phase and to the client that has to revise the contract basis for the system development.


###Scope

The aim of PowerEnjoy is to offer a car-sharing service to users, so that they can reserve, use and release electric cars.

The user can register to the service by using a mobile application that communicates with a system. To get access to the service the user must provide driving license, ID card and payment details; after system validation, a password will be sent for accessing the account.

Registered users have complete access to the functions of the application, being allowed to see available cars around them or close to a user specified address and to ask for a reservation. Users are also given the possibility to cancel the reservation.

After the reservation, a one hour time limit is imposed to reach the car and only once he gets close the system can unlock it; the user can communicate with the board installed on the car and enable an option provided to save money. In that case the system designates the place where to park and the user can get a discount if he confirms and parks there.

The user is charged at the end of the rental and the due amount is calculated on the time of the ride; in some cases, depending on the number of passengers, the battery level of the car and the place in which the user parks it, he may get discounts or get some extra charge.

Discounts and extra charge are calculated as follows:

* -10% off if the car has at least two other passengers;
* -20% off if the car is left with more than 50% of the battery;
* -30% if the car is parked and the users plugs it into the power grid;
* +30% if the car is left at more than 3km from the nearest power grid station or with less than 20% of the battery.

The service provided is available in the Italian area and a European driving license is required to register. The system knows the coverage of the service, the valid parking areas and the list of the charging stations (as a list of coordinates) and accesses users and cars’ locations via their GPS enabled on mobile phones and boards.

Cars that need maintenance for any reason and that are unavailable are not shown on users’ maps.
