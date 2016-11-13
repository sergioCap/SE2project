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
	credit: one CreditCard,
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

one sig PowerEnjoySystem {
	users: some User,
	operators: some Operator,
	cars: some Car,
	res: some Reservation,
	parkingAreas: some ParkingArea
}

sig ParkingArea{
	bounds: set Coordinates,
}

sig SpecialParkingArea extends ParkingArea {
	plugs: Int
}

sig PowerPlug {
	status: one Bool,
	plugNumber: Int
}

//********************************** FACTS********************************

fact powerEnjoyOwnsAll {
 	PowerEnjoySystem.users = User
 	PowerEnjoySystem.operators = Operator
 	PowerEnjoySystem.cars = Car
 	PowerEnjoySystem.res = Reservation
	PowerEnjoySystem.parkingAreas = ParkingArea
}

fact noReservationWhenMaintenance {
	all c:Car | c.maintenance = True => c.available=False
	all r: Reservation, c:Car | c.maintenance = True => r.car != c
	all o: Operator, r: Reservation, c:Car | o.assocMaintenance = c => r.car != c
}

fact noCreditCardwithoutUser {
	no c: CreditCard | c not in User.credit
}

fact noBatterywithoutCar {
	no b: BatteryLevel | b not in Car.batteryLevel
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
	all u: User | u.blocked = True => u.credit.valid = False
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

fact temp {
	 all c: Car | c.batteryLevel in Low => c.maintenance = True and c.available = False
}

//******************************Assertions************************

assert lowbatteryCarCannotBeReserved {
	no r: Reservation | r.car.batteryLevel in Low
}

assert lowbatteryCarsAreUnavailable{
	all c: Car | c.batteryLevel in Low => c.available=False and c.maintenance=True
}

assert UserWithoutCreditCard {
	no c: CreditCard | c not in User.credit
}

assert noValidCreditCardWhenTheUserIsBlocked {
	all u: User | u.blocked=True =>  u.credit.valid=False
}


pred show() {
	//#PowerEnjoySystem = 1
	#ParkingArea = 2
	#SpecialParkingArea = 1
}

run show for 3
check lowbatteryCarCannotBeReserved for 4
check lowbatteryCarsAreUnavailable for 3
check UserWithoutCreditCard for 4
check noValidCreditCardWhenTheUserIsBlocked for 4
