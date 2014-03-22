BigInteger =
  
  RADIX: 1000000000000000 # < Sqrt(2^52)
  RADIX_LOG10: 16
  name: "BigIntegerStatic"
  
  ZERO: undefined
  ONE: undefined
  M_ONE: undefined
  
  MAX_INT: undefined
  
# ----------------------------
  getSmall: (number) ->
# ----------------------------
    
    switch number
      
      when 0
        @ZERO ?= (new BigIntegerInstance()).toZero()
        return @ZERO
      
      when 1
        @ONE ?= new BigIntegerInstance([1], 1)
        return @ONE
      
      when -1
        @M_ONE ?= new BigIntegerInstance([1], -1)
        return @M_ONE
      
      else throw new Error("The given number is not small!")

# ----------------------------
  getMaxInt: ->
# ----------------------------
    return @MAX_INT ?= @parse(9007199254740992)

# ----------------------------
  parse: (number) ->
# ----------------------------
    
    if number.getName? and number.getName() is "BigInteger"
      return number
    
    switch number.constructor
      
      # --------
      when Array
      # --------
      
        if not @_verifyDigits(number)
          @_correctDigits(number)
        
        return new BigIntegerInstance(number, 1)
      
      # ---------
      when Number
      # ---------
        
        if number isnt number | 0
          throw new Error("A BigInteger can't be a float!")
        
        if -1 <= number <= 1
          return @getSmall(number)
        
        sign = if number > 0 then 1 else -1
        absNumber = sign * number
        
        if absNumber >= @RADIX
          return @parseWithSign(@_number2Array(absNumber), sign)
        
        absNumber = [absNumber]
        
        return new BigIntegerInstance(absNumber, sign)
      
      # ---------
      when String
      # ---------
        return BigIntegerInstance(@parseString(number))

# ----------------------------
  parseWithSign: (number, sign) ->
# ----------------------------
    bigInteger = @parse(number)
    bigInteger.setSign(sign)
    return bigInteger

# ----------------------------
  _number2Array: (number) ->
# ----------------------------
    
    result = []
    i = 0
    
    while number >= @RADIX
      result[i] = number % @RADIX
      number = (number / @RADIX) | 0
      i++
    
    return result

# ----------------------------
  _verifyDigits: (digits) ->
# ----------------------------
    
    for digit in digits
      if not (0 <= digit < @RADIX)
        return false
    
    return true
  
# ----------------------------
  _correctDigits: (digits) ->
# ----------------------------
    
    i = 0
    
    while i < digits.length
      
      if digits[i] >= @RADIX
        
        digits[i] = digits[i] % @RADIX
        
        digits[i+1] ?= 0
        digits[i+1] += ((digits[i] / @RADIX) | 0)
      
      i++