class BigIntegerInstance

  @name: 'BigInteger'
  
  constructor: (digits, sign) ->
    @setDigits(digits)
    @setSign(sign)
  
  clone: () ->
    return BigInteger.parseWithSign(@getDigits(), @getSign())
  
# ----------------------------
# Getters:
# ----------------------------
  
  getSign: -> return @sign
  getDigits: -> return @digits
  getDigitCount: -> return @digits.length
  getName: -> return @name

  getInteger: ->
  
    if @compareAbs(BigInteger.MAX_INT) is 1
      throw new Error("This BigInteger is too big to be an integer!")
    
    sum = 0
    sum += digit for digit in @getDigits()
      
    return sum

  #Static getters:
  ZERO: -> return BigInteger.getSmall(0)
  ONE: -> return BigInteger.getSmall(1)
  M_ONE: -> return BigInteger.getSmall(-1)

  RADIX: -> return BigInteger.RADIX

# ----------------------------
# Setters:
# ----------------------------

  setSign: (sign) ->
    
    if isZero() and sign isnt 0
      throw new Error("Zero can't have a sign different than 0!")
    
    if not isZero() and sign isnt 1 && sign isnt -1
      throw new Error("Illegal Number-Sign!")
    
    @sign = sign
  
  setNumbers: (digits) ->
    
    for digit in digits
      if not (0 < digit <= BigIntegerStatic.RADIX)
        throw new Error("Illegal digits chosen for a BigInteger!")
    
    i = digits.length - 1
    i-- while i > 0 and digits[i] is 0
    digits = digits[0..i]
    
    @digits = digits
