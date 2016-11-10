open util/boolean
//abstract sig Bool{}
//one sig True extends Bool
//one sig False extends Bool

sig Float {}

sig Text {}

sig Car {
	plate: Text,
	seats: Int,
	available : one Bool,
	energy: one Int //real
} {
	seats > 0
	seats <= 5
}

sig Coordinates {
	longitude: one Float, //float
	latitude: one Float //float
}

sig Licence {
	valid: one Bool
}

fact allLicencesAreOwned {
	User.licence = Licence
}

sig CreditCard {
	valid: one Bool,
	money: one Float
} {
	//money < 0 => valid = False
}

/*
sig Person {
	firstName: Text,
	lastName: Text,
	fiscalCode: Text
}
*/

sig FiscalCode {
	user: lone User
}


fact noFiscalCodeWithoutUser {
	all f: FiscalCode, u: User | f = u.fiscalCode <=> u = f.user
}


sig User { //extends Person {
	licence: one Licence,
	credit: CreditCard,
	fiscalCode: lone FiscalCode,
	registered: one Bool, // irrelevant?
	blocked: one Bool,
	banned: one Bool
} 

sig Reservation {
//	reservation: User -> Car
}

fact plateIsUniqueForCar {
	all c1, c2: Car | c1 != c2 => c1.plate != c2.plate
}

fact usersAreUnique {
	all u1, u2: User | u1 != u2 => u1.fiscalCode != u2.fiscalCode
}

fact noReservationIfNotValidCreditCard {
	// necessary?
}

fact oneUserOneCar {
	
}

pred show() {
#User = 6
}

run show for 6

// pred userHasNoMoney => system suspends
// pred carUnavailable
