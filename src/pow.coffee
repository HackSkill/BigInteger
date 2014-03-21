######################
# Raise to the power:
######################

# ----------------------------
  pow : (exponent) ->
# ----------------------------
    
    @_verifyExponent(exponent)
    
    # 0 ^ exponent = 0
    if @isZero()
      return @ZERO()
    
    # 1 ^ exponent = 1
    if @isOne()
      return @ONE()
    
    if @isMinusOne()
      
      # If exponent is even; (-1) ^ exponent = 1
      if exponent % 2 is 0
        return @ONE()
      
      # If exponent is odd; (-1) ^ exponent = -1
      else
        return @M_ONE()
    
    result = @clone()
    #actualExponent = 1
    
    #while actualExponent isnt exponent
    while exponent > 1
      
      if exponent % 2 is 1
        result.multiply(this)
        #actualExponent++
        exponent--
      
      else
        result.square()
        #actualExponent *= 2
        exponent /= 2
    
    return result
  
# ----------------------------
  modPow : (exponent, modulus) ->
# ----------------------------
    
    @_verifyExponent(exponent)
    
    result = @clone()
    #actualExponent = 1
    
    #while actualExponent isnt exponent
    while exponent > 1
      
      if exponent % 2 is 1
        result.multiply(this).modulo(modulus)
        #actualExponent++
        exponent--
      
      else
        result.square().modulo(modulus)
        #actualExponent *= 2
        exponent /= 2
    
    return result
  
# ----------------------------
  _verifyExponent : (exponent) ->
# ----------------------------
    
    if exponent.getName?() is "BigInteger"
      
      if exponent.getDigitCount() > 1
        throw new Error("WOW! Don't pow with such a large exponent!")
        
      exponent = exponent.getInteger()
    
    # We can't determine a negative-exponent-pow
    # in our integer world!
    if exponent < 0
      throw new Error("Don't pow with negative exponents!")
    
    # number ^ 0 = 1
    if exponent is 0
      return @ONE()
    
    # number ^ 1 = 1
    if exponent is 1
      return @clone()