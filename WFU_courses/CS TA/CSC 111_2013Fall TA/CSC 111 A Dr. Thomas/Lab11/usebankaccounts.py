from bankaccount import *

a1 = bankaccount( "98777" )
print("Withdrawing $100.00 from 98777")
print( a1.withdraw(100.00))
print("Depositing $100.00 to 98777")
print( a1.deposit(100.00))

a2 = bankaccount( "44311" )
print("Depositing $100.00 to 98777")
print( a2.deposit( 10.00 ))

a3 = bankaccount( "54221" )
print("Withdrawing $100.00 from 54221")
print( a3.withdraw(100.00))
print("Depositing $100.00 to 54221")
print( a3.deposit(100.00))
print("Depositing $200.00 to 54221")
print( a3.deposit(200.00))
print("Withdrawing $250 from 54221")
print( a3.withdraw(250))

a4 = bankaccount( "36712" )
print("Depositing 100000.00 to 36712")
print( a4.deposit( 100000.00 ))




