###ASSUMPTIONS

* The user interacts with the system using his mobile phone.

* The user has internet access enabled on his phone.

* Each car has GPS sensors (always turned on) providing the right coordinates, sensors to check the number of people sitting, a dashboard showing the status of the battery level and a screen displaying the current charge to users.

* Special parking areas are are a subset of safe parking areas and correspond to the ones with power plugs reserved to PowerEnjoy cars exclusively. PowerEnjoy cars can only be charged and plugged in special parking areas. 

* Safe parking areas and special parking areas are already defined and identified by coordinates: the system is initialized at start-up time with such a set of areas.

* Only one user at a time can drive a specific car.

* Each car has a maximum number of five seats.

* A car is unavailable when it has less then 5% of battery level, or it is under maintenance, or it is already in use or reserved by another user. Otherwise, it is available.

* Only registrations by users having a European driving licence are supported.

* The car can be driven anywhere in the Italian area.

* User payments are made using credit cards.

* Operators are already registered to the system.

* Discounts can be combined so that their total amount is subtracted to the final charge.

* Recharge slots can result as available or unavailable and their status can be checked and set by our system.

* In case the company receives a fine concerning a bad user behaviour caused by some violation, the user is due to pay it, so the system pays it in advance and then charges the amount to the user.

* The car is ignited using a power button functioning as a Start/Stop button.

#### OPERATOR GOALS


###REQUIREMENTS

* The system can always access to the real-time information of the car, such as its position, the number of people inside it, the battery level, the charging status and control unit information. Depending on this information, the system can manage the status of the car.

* The system can check the availability of power plugs of all stations at any time through a third part system collecting and providing this information.

* A user can use a car if and only if he has reserved it in advance.

* A car can be reserved by only one user at a time.

* The system sets the car as unavailable when its battery level is lower than 5%.

* The system has access to European Union driving licence databases to verify and approve user registration.

* The user should see on the map only available cars.

* The reservation of a car only ends if the user parks it in a safe parking area, otherwise the user keeps being charged.