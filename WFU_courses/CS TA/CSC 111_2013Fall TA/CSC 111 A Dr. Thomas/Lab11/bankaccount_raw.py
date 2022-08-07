# define a bankaccount class
#  -- sjt  November 2013

class bankaccount:

    def __init__(self, initnumber, initname="", initbalance=0):
        """ constructor for a bankaccount object;  behavior depends on
           whether it is being used to create a brand new account or
           to retrieve and apply transactions to an existing account """
        self.number = initnumber
        self.name = initname
        self.balance = initbalance

        filename = initnumber + '.txt'

        if initname == "" and initbalance == 0:   # existing account
            pass      # PART II - XXX replace with your own code XXX
        else:                                     # new account
            filehandle = open(filename, 'w')
            filehandle.write(self.number + '\n')
            filehandle.write(self.name + '\n')
            filehandle.write('B $' + format(self.balance,'.2f') + '\n')
            filehandle.close()

    def __str__(self):
        """ return a string representation of the important values
            in this object """
        return ("XXX")  # PART I - XXX replace with your own code XXX

    def withdraw(self, withdrawal):
        """ process a withdrawal from this account """
        if self.balance >= withdrawal:
            self.balance = self.balance - withdrawal  # update balance

            # save the information to the text file
            filehandle = open( self.number + '.txt', 'a' )
            filehandle.write('W $' + format(withdrawal,'.2f') + '\n')
            filehandle.write('B $' + format(self.balance,'.2f') + '\n')
            filehandle.close()

            # return a positive message
            return ("Please remove your cash from the drawer.\n" +
                    self.__str__() + '\n')
        else:
            # return a negative message
            return ("Insufficient funds.\n" + self.__str__() + '\n')

    def deposit():
        pass





