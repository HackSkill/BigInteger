######################
# Addition:
######################
  
# ----------------------------
  add: (otherNumber) ->
# ----------------------------
    
    otherNumber = BigInteger.parse(otherNumber)
    
    # No need for calculation: a + 0 = a
    if otherNumber.isZero()
      return @clone()
    
    # Signs are not equal; we're dealing with a substraction.
    if otherNumber.getSign() isnt @getSign()
      
      if @isPositive()
        @substract(otherNumber)
      else
        otherNumber.substract(this)
    
    
    a = @getDigits()
    b = otherNumber.getDigits()
    
    # a should be greater than b.
    # If it isn't the case then we're switching them.
    if a.length < b.length
      [a, b] = [b, a]
    
    sumNumbers = []
    numberPart = 0
    carry = 0
    i = 0
    
    while i < a.length or carry isnt 0
      
      if i < b.length
        numberPart = a[i] + b[i] + carry
      
      else if i < a.length
        numberPart = a[i] + carry
      
      else
        numberPart = carry
      
      if i < b.length or carry isnt 0
        sumNumbers[i] = numberPart % @RADIX
        carry = numberPart // @RADIX
        
      else
        sumNumbers[i] = numberPart
        
      i++
    
    return BigInteger.parseWithSign(sumNumbers, @getSign)
