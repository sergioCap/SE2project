open util/boolean
//abstract sig Bool{}
//one sig True extends Bool
//one sig False extends Bool

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
	position: one Coordinates
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

fact allLicencesAreOwned {
	User.licence = Licence
}

sig CreditCard {
	valid: one Bool
}

sig FiscalCode {
	user: one User
}


fact noFiscalCodeWithoutUser {
	all f: FiscalCode, u: User | f = u.fiscalCode <=> u = f.user
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
}

run show for 4

// pred userHasNoMoney => system suspends
// pred carUnavailable
