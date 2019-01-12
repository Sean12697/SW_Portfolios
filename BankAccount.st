Object subclass: #Account
	instanceVariableNames: 'balance interestRate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BankAccount'!

!Account methodsFor: 'operation' stamp: 'LM 1/9/2019 14:23'!
credit: amount 
	balance:=  balance+amount! !

!Account methodsFor: 'operation' stamp: 'SO 1/9/2019 16:04'!
yearsUntilAmount: amount
	
	|yrs forecast|
	yrs:= 0.	
	forecast:= 0.
	(amount > balance) 
	ifTrue: [[ amount > forecast ] whileTrue:  [ 
		yrs:= yrs+1.
		forecast := balance * ((1+interestRate)raisedTo: yrs).
		].
		^yrs]
	ifFalse: [^0] 

! !

!Account methodsFor: 'operation' stamp: 'SO 1/9/2019 15:34'!
predictBalanceAfteryrs: yrs
	|forecast|
	
	forecast:= balance * ((1+interestRate)raisedTo: yrs ).
	^forecast! !


!Account methodsFor: 'accessing' stamp: 'SO 1/9/2019 14:43'!
intrestRate
	^interestRate ! !

!Account methodsFor: 'accessing' stamp: 'SO 1/9/2019 14:36'!
balance
	^balance ! !


Account subclass: #CurrentAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BankAccount'!

!CurrentAccount methodsFor: 'initialization' stamp: 'SO 1/9/2019 15:22'!
initialize

	balance:= 0.
	interestRate:= 0.005.
	! !

!CurrentAccount methodsFor: 'operation' stamp: 'SO 1/9/2019 14:22'!
debit: amount
	(balance-amount > 0)
	ifTrue:  [ balance:= balance-amount ] 
	ifFalse: [ balance:= balance ]	
	! !


Account subclass: #SavingsAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BankAccount'!

!SavingsAccount methodsFor: 'initialization' stamp: 'SO 1/9/2019 15:48'!
initialize

	balance:= 0.
	 interestRate:= 0.015.! !
