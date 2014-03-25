class BigIntegerInstance
  
  constructor: (digits = [42], sign = 1) ->
    @setDigits(digits)
    @setSign(sign)
  
  toZero: () ->
    @digits = [0]
    @sign = 0
    return this
  
  clone: () ->
    if @isZero() then return @ZERO()
    return BigInteger.parseWithSign(@getDigits(), @getSign())
  
# ----------------------------
# Getters:
# ----------------------------
  
  getSign: -> return @sign
  getDigits: -> return @digits
  getDigitCount: -> return @digits.length
  getName: -> return 'BigInteger'
  getData: -> return [@getDigits(), @getSign()]

  getInteger: ->
    
    if @compareAbs(BigInteger.getMaxInt()) is 1
      throw new Error("This BigInteger is too big to be an integer!")
    
    sum = 0
    sum += digit for digit in @getDigits()
      
    return sum * @getSign()

  #Static getters:
  ZERO: -> return BigInteger.getZero()
  ONE: -> return BigInteger.parse(1)
  M_ONE: -> return BigInteger.parse(-1)

  RADIX: -> return BigInteger.RADIX

# ----------------------------
# Setters:
# ----------------------------

  setSign: (sign) ->
    
    if @isZero()
      
      # In case we submit a -0.
      if sign is 0 or 1/sign is -Infinity
        sign = Math.abs(sign)
      
      else
        throw new Error("Zero can't have a sign different than 0!")
    
    # Sign isn't valid.
    else if sign isnt 1 and sign isnt -1
      throw new Error "Illegal Number-Sign!"
    
    @sign = sign
  
  setDigits: (digits) ->
    
    for digit in digits
      
      if not (0 <= digit < @RADIX())
        throw new Error("Illegal digits chosen for a BigInteger! -> "+digit)
      
      # Setting all -0 to 0
      if digit is 0
        digit = Math.abs(digit)
    
    i = digits.length - 1
    i-- while i > 0 and digits[i] is 0
    digits = digits[0..i]
    
    @digits = digits
