#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      yingrc13
#
# Created:     30/10/2013
# Copyright:   (c) yingrc13 2013
# Licence:     <your licence>
#-------------------------------------------------------------------------------
import os

# ----------------- DATE --------------------#

def date(astring):
    """Retrieve date from file name"""
    values = astring.split('.')
    info = values[0].split('-')
    date = info[1] + "-" + info[2] + "-" + info[3]
    return date

# ----------------- TOTAL TAKE --------------------#

def stripsigns( astring ):
    """Remove dollar signs"""
    signs = "$"
    nosigns = ""
    for numbers in astring:
        if numbers not in signs:
            nosigns = nosigns + numbers
    return nosigns

def totaltake():
    """Calculate total take"""
    infilehandle = open (infilename, "r")
    total = 0
    for line in infilehandle:
        values = line.split(':')
        cardnumbers = values[1]
        cardnumbers = stripsigns(cardnumbers)
        total = (total + eval(cardnumbers))
        total = round(total,2)
    return total

# ----------------- CASH TAKE --------------------#

def findcash():
    """Calculate total cash take"""
    infilehandle = open (infilename, "r")
    cashtotal = 0
    for line in infilehandle:
        values = line.split(':')
        payment = values[0]
        if payment == "cash":
            cash = values[1]
            cash = stripsigns(cash)
            cashtotal = (cashtotal + eval(cash))
            cashtotal = round(cashtotal,2)
    return cashtotal

# ----------------- CARD TAKE --------------------#

def findcredit():
    """Calculate total card take"""
    infilehandle = open (infilename, "r")
    credittotal = 0
    for line in infilehandle:
        values = line.split(':')
        payment = values[0]
        if payment != "cash":
            credit = values[1]
            credit = stripsigns(credit)
            credittotal = (credittotal + eval(credit))
            credittotal = round(credittotal,2)
    return credittotal

# ----------------- TIPS --------------------#

def totaltip():
    """Calculate total tips"""
    totaltip = 0
    infilehandle = open (infilename, "r")
    for line in infilehandle:
        values = line.split(':')
        numbers = values[2]
        numbers = stripsigns(numbers)
        totaltip = totaltip + float(numbers)
    totaltip = round(totaltip,2)
    return totaltip


# ----------------- TAX --------------------#

def computetax(rate, total):
    """Calculate tax owed"""
    total = totaltake()
    tip = totaltip()
    taxrate =(rate/100)
    taxable = total-tip
    taxed = (taxable / (1 + taxrate)) * taxrate
    taxed = round(taxed,2)
    return taxed

# ---------------- PATRONS --------------------#

def countpatrons():
    """Count the total number of patrons"""
    infilehandle = open (infilename, "r")
    totalpatrons = 0
    for line in infilehandle:
        values = line.split(':')
        numbers = values[3]
        numbers = stripsigns(numbers)
        totalpatrons = totalpatrons + float(numbers)
    totalpatrons = round(totalpatrons,0)
    return totalpatrons

# ---------------- AVERAGE --------------------#

def computeaverage(patrons, total):
    """Find the average amount spent by each person"""
    total = totaltake()
    patrons = countpatrons()
    average = (total/patrons)
    average = round(average,2)
    return average

# ---------------- WINE TIPS --------------------#

def avgtipwine():
    """Find the average tip percentage for orders with wine"""
    infilehandle = open (infilename, "r")
    wcount = 0
    wtotaltip = 0
    for line in infilehandle:
        values = line.split(':')
        ordered = values[4]
        if 'wine' in ordered:
            wcount = wcount + 1
            total = eval(stripsigns(values[1]))
            tip = eval(stripsigns(values[2]))
            bill = total - tip
            tiprate = (tip/bill)
            wtotaltip = wtotaltip + tiprate
    if wcount == 0:
        return "0"
    wavg = (wtotaltip/wcount) * 100
    wavg = round(wavg, 1)
    return wavg

def avgtipnowine():
    """Find the average tip percentage for orders without wine"""
    infilehandle = open (infilename, "r")
    nwcount = 0
    nwtotaltip = 0
    for line in infilehandle:
        values = line.split(':')
        ordered = values[4]
        if 'wine' not in ordered:
            nwcount = nwcount + 1
            total = eval(stripsigns(values[1]))
            tip = eval(stripsigns(values[2]))
            bill = total - tip
            tiprate = (tip/bill)
            nwtotaltip = nwtotaltip + tiprate
    if nwcount == 0:
        return "0"
    nwavg = (nwtotaltip/nwcount) * 100
    nwavg = round(nwavg, 1)
    return nwavg

# ---------------- PARTY TIPS --------------------#

def smallparty():
    """Find the average tip percentage for groups of 4 or less"""
    infilehandle = open (infilename, "r")
    scount = 0
    stotaltip = 0
    for line in infilehandle:
        values = line.split(':')
        party = eval(values[3])
        if party <= 4:
            scount = scount + 1
            total = eval(stripsigns(values[1]))
            tip = eval(stripsigns(values[2]))
            bill = total - tip
            tiprate = (tip/bill)
            stotaltip = stotaltip + tiprate
    if scount == 0:
        return "0"
    savg = (stotaltip/scount) * 100
    savg = round(savg, 1)
    return savg

def bigparty():
    """Find the average tip percentage for groups of more than 4"""
    infilehandle = open (infilename, "r")
    bcount = 0
    btotaltip = 0
    for line in infilehandle:
        values = line.split(':')
        party = eval(values[3])
        if party >= 5:
            bcount = bcount + 1
            total = eval(stripsigns(values[1]))
            tip = eval(stripsigns(values[2]))
            bill = total - tip
            tiprate = (tip/bill)
            btotaltip = btotaltip + tiprate
    if bcount == 0:
        return "0"
    bavg = (btotaltip/bcount) * 100
    bavg = round(bavg, 1)
    return bavg

# ---------------- FIND BAD CARDS --------------------#

def stripHyphens( astring ):
    """Remove hyphens"""
    hyphens = "-"
    nohyphens = ""
    for numbers in astring:
        if numbers not in hyphens:
            nohyphens = nohyphens + numbers
    return nohyphens

def allDigits( astring ):
    """Check to make sure all characters are numbers"""
    if astring.isdigit():
        return True
    else:
        return False

def checkVisa( CCN ):
    """Check if the credit card number is valid using Luhn's algorithm"""
    sum = 0
    index = 0
    for aNum in CCN:
        index = index + 1
        if (index % 2 == 0):
            sum = int(aNum) + sum
        else:
            aNum = int(aNum) * 2
            if (int(aNum) < 10):
                sum = int(aNum) + sum
            else:
                nOne = int(aNum) // 10
                nTwo = int(aNum) % 10
                sum = sum + nOne + nTwo
    if (sum % 10 == 0):
        return True
    else:
        return False

def badcard():
    """Write a file containing bad credit card numbers"""
    lines = 0
    outfile = open(badfile, "w")
    infilehandle = open (infilename, "r")
    for line in infilehandle:
        values = line.split(':')
        CCN = values[0]
        CCN = stripHyphens( CCN )
        if allDigits(CCN) == True and checkVisa(CCN) == True or len(values[0]) == 4:
            pass
        else:
            outfile.write(CCN + '\n')
            lines = lines + 1
    return lines

def badcardfile(astring):
    """Name the file containing bad credit card numbers"""
    values = astring.split('.')
    name = values[0].split('-')
    name[0] = "badnumbers"
    name = name[0] + "-" + name[1] + "-" + name[2] + "-" + name[3] + "." + values[1]
    return name

# ---------------- INPUT --------------------#

infilename = input("What receipt file would you like to process?")
while not os.path.exists(infilename):
    print("File not found.")
    infilename = input("What receipt file would you like to process?")

rate = eval(input("Input the tax rate as an integer:"))

# ---------------- VARIABLES --------------------#

date = date(infilename)
total = totaltake()
cash = findcash()
credit = findcredit()
tips = totaltip()
tax = computetax(rate,total)
patrons = countpatrons()
average = computeaverage(patrons, total)
winetips = avgtipwine()
nowinetips = avgtipnowine()
bigparty = bigparty()
smallparty = smallparty()
badfile = badcardfile(infilename)
badfilenumbers = badcard()

# ---------------- OUTPUT --------------------#

print("Cafe Delle Cagne -- closing stats for", date)
print("Total take: $", total)
print("Cash take: $", cash)
print("Card take: $", credit,)
print("Tips to disburse: $", tips)
print("Tax owed to NC: $", tax)
print("There were", patrons, "patrons who spent an average of $", average)
print("Bills with wine averaged a", winetips, "% tip.")
print("Bills without wine averaged a", nowinetips, "% tip.")
print("Parties with more than 4 people averaged a", bigparty, "% tip.")
print("Parties with 4 or less people averaged a", smallparty, "% tip.")
print("There were", badfilenumbers, "bad credit card numbers.")
