######################
# Substraction:
######################
  
# ----------------------------
  substract: (otherNumber) ->
# ----------------------------
    
    otherNumber = BigInteger.parse(otherNumber)
    
    #If one of the numbers is zero.
    if @isZero()
      return otherNumber.negate()
    
    if otherNumber.isZero()
      return this
    
    a = @getDigits()
    b = otherNumber.getDigits()
    
    # Signs are not equal; we're dealing with an addition:
    # (+|a|) - (-|b|) = (+|a|) + (+|b|)
    # (-|a|) - (+|b|) = (-|a|) + (-|b|)
    if otherNumber.getSign() isnt @getSign()
      return @add(otherNumber.negate())
    
    # We want a and b to be positive.
    # If they're not, we need to switch them:
    # (-|a|) - (-|b|) = (+|b|) - (+|a|)
    if @isNegative()
      [a, b] = [b, a]
    
    # We compare a and b to get the result's sign.
    # If a > b then a - b > 0.
    # If a < b then a - b < 0.
    resultSign = @compareAbs(otherNumber)
    
    # The numbers are equal; the result is zero:
    # a - a = 0
    if resultSign is 0
      return @ZERO()
    
    # We want to determine a - b with a > b.
    # If it's not the case, we swap a and b:
    # With a < b : a - b = -(b - a)
    if resultSign is -1
      [a, b] = [b, a]
    
    diffNumbers = []
    numberPart = 0
    carry = 0
    i = 0
    
    while i < a.length
      
      if i < b.length
        numberPart = a[i] - b[i] - borrow
      else
        numberPart = a[i] - borrow
      
      if numberPart < 0
        borrow = 1
        numberPart += @RADIX()
      else
        borrow = 0
      
      diffNumbers[i] = numberPart
      i++
    
    return BigInteger.parseWithSign(diffNumbers, resultSign)