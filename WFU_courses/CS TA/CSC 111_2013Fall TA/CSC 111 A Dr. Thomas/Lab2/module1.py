
#x = 100
#y = 200
#print(x+y)
#print(2+7)



#weight = eval(input("the first: "))

#height = eval(input("the second :"))

#bmi = 702 *weight/ height / height

#print("Your bmi  is ", bmi)

#{

#}




number = eval(input("enter an integer from 0 and 999: "))
remainder = number

thridDigit = remainder % 10
print(thridDigit)
remainder = remainder // 10
print(remainder)

middleDigit =remainder % 10
print(middleDigit)
remainder = remainder // 10
print(remainder)

firstDigit = remainder % 10
print(firstDigit)


sum = thridDigit+middleDigit+firstDigit


print("the sum of all the digits in",number,"is",sum)



