######################
# Product:
######################
  
# ----------------------------
  multiply: (otherNumber) ->
# ----------------------------
    
    otherNumber = BigInteger.parse(otherNumber)
    
    # One of the numbers is zero; the result is zero.
    # a * 0 = 0 or 0 * b = 0
    if otherNumber.isZero() or @isZero()
      return @ZERO
    
    result = @multiplyAbs(otherNumber)
    
    # The numbers aren't the same sign; the result is negative.
    # (+|a|) * (-|b|) = - ((+|a|) * (+|b|))
    # (-|a|) * (+|b|) = - ((+|a|) * (+|b|))
    if @getSign() isnt otherNumber.getSign()
      return result.negate()
    
    return result
  
# ----------------------------
  multiplyAbs: (otherNumber) ->
# ----------------------------
    
    otherNumber = BigInteger.parse(otherNumber)
    
    # One of the numbers is zero; the result is zero.
    # a * 0 = 0 or 0 * b = 0
    if otherNumber.isZero() or @isZero()
      return @ZERO
    
    multDigits = _karatsubaMult(@getDigits(), otherNumber.getDigits())
    
    return BigInteger.parseWithSign(multDigits, 1)
  
# ----------------------------
  _karatsubaMult: (a, b) ->
# ----------------------------
  
    # Recursion break.
    # Direct multiplication is safe here since the numbers are
    # lower than the square root of the maximal integer value.
    if a.length is 1 and b.length is 1
      return BigInteger.parse([a[0] * b[0]])
    
    splitIndex = Math.max(a.length, b.length) // 2
    
    # Spliting a and b at the spliting index if possible.
    [lowerA, higherA] = (splitIndex < a.length) ?
      [a[..splitIndex], a[splitIndex..]] : [a, [0]]
    
    [lowerB, higherB] = (splitIndex < b.length) ?
      [b[..splitIndex], b[splitIndex..]] : [b, [0]]
    
    # Parsing a's and b's parts to BigIntegers.
    numbers = [lowerA, higherA, lowerB, higherB]
    numbers = BigInteger.parse(number) for number in numbers
    [lowerA, higherA, lowerB, higherB] = numbers
    
    sumA = lowerA.add(higherA)
    sumB = lowerB.add(higherB)
    
    highMult = higherA.multiplyAbs(higherB)
      .shiftRight(2*splitIndex)
      
    middleMult = sumA.multiplyAbs(sumB)
      .shiftRight(splitIndex)
    
    lowMult = lowerA.multiplyAbs(lowerB)
    
    return highMult.add(middleMult.add(lowMult))