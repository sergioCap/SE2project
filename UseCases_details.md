##Use Cases

### The System Picks up money from the client credit card

####Participating actors:
System

####Entry Conditions:
The system has calculated the amount that the user have to pay

####Flow of events:

####Exit contitions:
The system has received a message from the external payment system that the payment has been completed successfully.

####Exception:
The payment fails due to missing money on the credit card or blocked card. The system receive a failure message and communicate to the user a deadline for the payment and makes the user unable to reserve a car. If the user exceed the deadline, the system ban the account forever and delegate the problem to a debt collecting company.

####Special Requirements:
