from bankaccount import *

# Use the bankaccount class to create five bank account objects
# Note that creating a bank account also creates a text file with
# the same name as the account.  The text file becomes a
# "permanent" record for the account.

print("Creating new account.")
a1 = bankaccount( "36712", "Susan Z Smith", 1000.00 )
print(a1)

print("Creating new account.")
a2 = bankaccount( "54221", "John J Doe", 100.00 )
print(a2)

print("Creating new account.")
a3 = bankaccount( "12445", "John Jacob Jingelhimer", 5.55 )
print(a3)

print("Creating new account.")
a4 = bankaccount( "98777", "Madeline L Notsobright", 55.00 )
print(a4)

print("Creating new account.")
a5 = bankaccount( "44311", "Rebecca F Sunnybrook", 43989.00 )
print(a5)



