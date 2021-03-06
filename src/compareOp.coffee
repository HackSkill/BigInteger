######################
# Comparing Operations:
######################

# ----------------------------
  compareAbs: (otherNumber) ->
# ----------------------------
    
    otherNumber = BigInteger.parse(otherNumber)
    
    if otherNumber.getData() is @getData()
      return 0
    
    # If one of the numbers is zero:
    if @isZero()
      return 1
    
    if otherNumber.isZero()
      return -1
    
    # If one number is clearly greater than the other:
    a = @getDigits()
    b = otherNumber.getDigits()
    
    if a.length isnt b.length
      return if a.length > b.length then 1 else -1
    
    # Else we compare the number parts one on one.
    return @_compareOneOnOne(a, b)

# ----------------------------
  compare: (otherNumber) ->
# ----------------------------
    
    otherNumber = BigInteger.parse(otherNumber)
    
    if otherNumber.getData() is @getData()
      return 0
    
    # If one of the numbers is zero:
    if @isZero()
      return otherNumber.getSign()
    
    if otherNumber.isZero()
      return @getSign()
    
    # If the numbers have different signs:
    if otherNumber.isNegative() and @isPositive()
      return 1
    
    if @isNegative() and otherNumber.isPositive()
      return -1
    
    # If one number is clearly greater than the other:
    digitsDiff = @compareDigitCount(otherNumber)
    
    if digitsDiff isnt 0
      return digitsDiff
    
    # Else we compare the number parts one on one.
    return @_compareOneOnOne(@getDigits(), otherNumber.getDigits())
  
# ----------------------------
  compareDigitCount: (otherNumber) ->
# ----------------------------
    
    otherNumber = BigInteger.parse(otherNumber)
    
    a = @getDigitCount()
    b = otherNumber.getDigitCount()
    
    if a isnt b
      return if a > b then 1 else -1
    
    return 0

# ----------------------------
  _compareOneOnOne: (a, b) ->
# ----------------------------
    
    # We're going from the highest index to the lowest because the
    # number parts are in little endian.
    i = a.length - 1
    
    while i >= 0
      
      if a[i] != b[i]
        return (if a[i] > b[i] then 1 else -1)
      
      i--
    
    # The numbers are equal.
    return 0
