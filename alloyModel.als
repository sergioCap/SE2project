open util/boolean

sig Float {}

sig Text {}

abstract sig BatteryLevel {}

sig Low extends BatteryLevel {}

sig High extends BatteryLevel {}

sig Car {
	plate: one Text,
	seats: Int,
	available: one Bool,
	batteryLevel: one BatteryLevel,
	position: one Coordinates,
	maintenance: one Bool,
	assocMaintenance: lone Operator,
	assignedToOperator: one Bool
} {
	seats > 0
	seats <= 5
}

sig Coordinates {
	longitude: one Float,
	latitude: one Float
}

sig Licence {
	valid: one Bool
}


sig CreditCard {
	valid: one Bool
}

sig FiscalCode {
	user: one User
}

sig User {
	licence: one Licence,
	credit: CreditCard,
	fiscalCode: one FiscalCode,
	blocked: one Bool,
	banned: one Bool,
	position: Coordinates
} 

sig Reservation {
	user: one User,
	car: one Car
} {
	user.blocked = False
	user.banned = False
	user.licence.valid = True
	car.available = False
	car.batteryLevel = High
	car.maintenance = False
}

sig Operator{
	assocMaintenance: lone Car
}

one sig PowerEnjoy {
	users: User,
	operators: Operator,
	cars: Car
}

//********************************** FACTS********************************

fact {
	PowerEnjoy.users = User
	PowerEnjoy.operators = Operator
	PowerEnjoy.cars = Car
}

fact noReservationWhenMaintenance {
	all c:Car | c.maintenance =True => c.available=False
	//all r: Reservation, c:Car | c.maintenance = True => r.car != c
//	all o: Operator, r: Reservation, c:Car | o.assocMaintenance = c => r.car != c
}

fact eachUserShouldHaveCreaditCard {
	all c: CreditCard, u: User | c = u.credit
}

fact allLicencesAreOwned {
	User.licence = Licence
}

fact noFiscalCodeWithoutUser {
	all f: FiscalCode, u: User | f = u.fiscalCode <=> u = f.user
}

fact assocMaintenance {
	all c:Car, o:Operator |
		((o in c.assocMaintenance) <=> (c in o.assocMaintenance))
}

fact userBlockedIfCreditNotValid {
	all u: User | u.credit.valid = False => u.blocked = True
}

fact plateIsUniqueForCar {
	all c1, c2: Car | c1 != c2 => c1.plate != c2.plate
}

fact usersHaveUniqueFiscalCodeAndLicence {
	all u1, u2: User | u1 != u2 => u1.fiscalCode != u2.fiscalCode && u1.licence != u2.licence
}

fact sameReservationDifferentUserAndCar {
	all r1, r2: Reservation | r1 != r2 => r1.user != r2.user && r1.car != r2.car
}

fact onlyUnavailableCarsShouldBeInReservation {
	//no r: Reservation
}

fact noReservationIfNotValidCreditCard {
	// necessary?
}

fact oneUserOneCar {
	
}

pred show() {
	#PowerEnjoy = 1
	#Reservation=1
	#CreditCard = 3
	#User = 3
}

run show for 4

