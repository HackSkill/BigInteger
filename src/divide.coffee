######################
# Quotient:
######################
  
# ----------------------------
  divide: (otherNumber) ->
# ----------------------------
    return (@divideWithRemainder(otherNumber))[0]

# ----------------------------
  quotient: (otherNumber) ->
# ----------------------------
    return @divide(otherNumber)

# ----------------------------
  modulo: (otherNumber) ->
# ----------------------------
    return (@divideWithRemainder(otherNumber))[1]

# ----------------------------
  divideWithRemainder: (otherNumber) ->
# ----------------------------
    
    otherNumber = BigInteger.parse(otherNumber)
    
    # Division by zero? No, no! No good!
    if otherNumber.isZero()
      throw new Error("Divided by zero!? Oh no! You just created a black hole!")
    
    # Division of zero? Easy.
    if @isZero()
      return [@ZERO, @ZERO]
    
    # They are multiples of the radix;
    # we can perform a left shift for both.
    if @getDigits()[0] is 0 and @getDigits()[0] is 0
      return @shiftLeft().divideWithRemainder(b.shiftLeft())
    
    # Is it a division we can make with plain math?
    if @getDigitsCount is 1 and otherNumber.getDigitsCount is 1
      
      remainder = getDigits()[0] % otherNumber.getDigits()[0]
      quotient = (getDigits()[0] - remainder) / otherNumber.getDigits()[0]
      
      return [BigInteger.parse(quotient), BigInteger.parse(remainder)]
    
    
    switch @compareAbs(otherNumber)
      
      # Both numbers are of equal magnitude.
      when 0
        
        # Both numbers are equal.
        # a / a = 1 and a mod a = 0
        if @getSign() is otherNumber.getSign()
          return [@ONE, @ZERO]
        
        # Both Digits are of opposite sign.
        # +|a| / -|a| = -1 and +|a| mod -|a| = 0
        # -|a| / +|a| = -1 and -|a| mod +|a| = 0
        else
          return [@M_ONE, @ZERO]
      
      # b is bigger than a:
      # a / b = 0
      when -1
        
        # +|a| mod +|b| = +|a|
        # -|a| mod -|b| = -|a|
        if @getSign() is otherNumber.getSign()
          return [@ZERO, this]
        
        # +|a| mod -|b| = (-|b|) + (+|a|)
        # -|a| mod +|b| = (+|b|) + (-|a|)
        else
          return [@ZERO, otherNumber.add(this)]
      
      # a is bigger than b, no more way around!
      when 1
        
        #FIXME: Algorithm is way too slow!
        return @_naiveDivide(this, otherNumber)
  
# ----------------------------
  _naiveDivide: (a, b) ->
# ----------------------------
    
    # If b * q = a with q a decimal number < Radix
    if  b.getDigitsCount() <= a.getDigitsCount() <= b.getDigitsCount() + 1
      
      # Radix/b.lastDigit
      splitIndex = @RADIX / b.getDigits()[b.length-1]
      
      # If a and b have the same amount of digits:
      # 1 <= q < Radix/b.lastDigit
      if a.compareDigitCount(b) is 0
        qRangeBegin = 1
        qRangeEnd = splitIndex - 1
      
      # Else:
      # Radix/b.lastDigit <= q < Radix
      else
        qRangeBegin = splitIndex
        qRangeEnd = @RADIX - 1
      
      qRangeLength = qRangeBegin - qRangeEnd
      
      # We use a binary-search-algorithm to find q.
      while qRangeLength > 1
        
        qCandidate = ((qRangeBegin + qRangeEnd) / 2) | 0
        bMulQCandidate = b.multiply(qCandidate)
        
        switch bMulQCandidate.compareAbs(a)
          
          # When b * qCandidate = a
          # We have found q! (and there is no remainder)
          when 0
            q = BigInteger.parse(qCandidate)
            return [q, @ZERO]
          
          # When b * qCandidate > a
          # q must be between qRangeBegin and qCandidate.
          when 1
            qRangeEnd = qCandidate
          
          # When b * qCandidate > a
          # q must be between qCandidate and qRangeEnd.
          when 1
            qRangeBegin = qCandidate
      
      # q is not an integer and qRangeBegin < q < qRangeEnd
      # so q = qRangeBegin + r with 0 < r < 1
      # The quotient of the division is qRangeBegin.
      remainder = a.substract(b.multiply(qRangeBegin))
      return [qRangeBegin, remainder]
    
    else
      
      digitFillerIndex = a.length - 1
      remainder = quotient = @ZERO
      
      while digitFillerIndex >= 0
      
        remainderShifts = 1
        
        # Determines the actual remainder.
        while remainder.compareAbs(b) is -1 and digitFillerIndex >= 0
          
          remainder.shiftRightFor(a.extract(digitFillerIndex))
          
          if remainderShifts > 1
            quotient.shiftRight()
          
          digitFillerIndex--
          remainderShifts++
        
        [semiQuotient, remainder] = remainder.divideWithRemainder(b)
        quotient.shiftRightFor(semiQuotient)
    
    