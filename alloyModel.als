open util/boolean

sig Car {
	plate: String,
	seats: Int
} {
	seats > 0
	seats <= 5
}

fact plateIsUniqueForCar {
all c1, c2: Car | c1 != c2 => c1.plate != c2.plate
}

sig Person {}

sig Licence {}

sig User {
	personalData: Person,
	licence: Licence,
	credit: CreditCard,
	registered: one Bool,
	suspended: one Bool
}

fact usersAreUnique {
	all u1, u2: User : u1 != u2 => u1.personalData != u2.personalData
}

sig CreditCard {
	money: Int
}


// pred userHasNoMoney => system suspends
// pred carUnavailable
