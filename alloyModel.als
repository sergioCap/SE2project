open util/boolean
//abstract sig Bool{}
//one sig True extends Bool
//one sig False extends Bool

sig Car {
	plate: String,
	seats: Int,
	available : one Bool,
	energy: Int //real
} {
	seats > 0
	seats <= 5
}

fact plateIsUniqueForCar {
	all c1, c2: Car | c1 != c2 => c1.plate != c2.plate
}

sig Coordinates {
	longitude: Int, //float
	latitude: Int //float
}

sig Licence {
	valid: one Bool
}

sig CreditCard {
	valid: one Bool,
	money: Int
} {
	money < 0 => valid = False
}

sig Person {}

sig User {
	personalData: Person,
	licence: Licence,
	credit: CreditCard,
	registered: one Bool, // irrelevant?
	blocked: one Bool,
	banned: one Bool
}

fact usersAreUnique {
	all u1, u2: User | u1 != u2 => u1.personalData != u2.personalData
}

sig Reservation {
//	reservation: User -> Car
}

fact noReservationIfNotValidCreditCard {
	// necessary?
}

fact oneUserOneCar {
	
}

pred show() {
}

run show for 6

// pred userHasNoMoney => system suspends
// pred carUnavailable
