###REQUIREMENTS

####USER GOALS

G1. The user should be able to register to the system

* The user must enter all his personal data, ID card data and driving licence informations
* The system should validate the data entered by asking the external system for driving licence verifications
* If correct, the system should provide to the user a password to access the service


G2. Already registered users should be allowed to login

* The user should be allowed to enter login informations
* The system should validate entered data and allow the access if all is correct


G3. The user should be able to find available cars around him

* The system can check user coordinates accessing GPS on user's phone
* The system should provide a map on which available cars are identified by a symbol showing the correct position


G4. The user should see the status of a car before making a reservation

* The system should provide informations about the car when the user picks one of the availables, before reserving it


G5. The user should be able to reserve a car

* The user can select one of the cars to see its status and reserve it
* The system should ensure that the user can pay for the reservation before accepting it, by taking a certain amount of money in advance or by trying a transaction to avoid blocked credit cards
* The system should make the car unavailable to other users


G6. The user should be granted the access to the reserved car once he reaches it

* User can notify the system that he has reached the car
* The system should check user coordinates to compare them with car's ones and unlock it if the distance is less than 10m


G7. The user should be allowed to cancel a reservation

* The system should offer an option to the user to cancel the reservation
* Once the reservation is canceled the user should be able to access again to the map with available cars


G8. The user should be able to access profile and payment method and make changes

* The system should provide a personal profile to the user with his informations and give the possibility to apply changes


G9. The user should be informed of the amount he has been charged of

* The system should calculate the total charge after subtracting all the accumulated discounts.
* The system should notify the user about the final amount of the reservation and how it was calculated


G10. After the ride the user should be able to inform the system that he is leaving the car

* The user should have a way to notify the system he has finished using the car
* The system should verify the status of the car and check the parking
* If all is correct the system should lock the car and make it available again


####SYSTEM GOALS

G11. Unavailable cars should not be displayed to users

* The system should hide from the map unavailable cars for maintenance/low battery/other reasons


G12. The system should show on the map cars that become available again

* The system should verify the status of each unavailable car
* If it has all the requirements to become available again it should be made visible to users on the map


G13. A reserved car should become available if the user doesn't pick it up within one hour from the reservation

* The system should run a countdown once the user makes the reservation
* Once the countdown finishes, the system should make the car available again
* The system should also carge 1EUR fee to the user and inform him on that


G14. Only registered users should be allowed to see the map and reserve cars

* The system should require a login to check the user before letting user access to all functions


G15. Cars that are not in an usable status should be sent to maintenance

* The system should check the status of a car and contact external operators if it needs to be recharged, moved or maintained