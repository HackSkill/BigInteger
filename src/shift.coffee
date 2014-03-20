######################
# Shift:
######################
  
# ----------------------------
  shiftRight: (amount = 1) ->
# ----------------------------
    
    if amount < 0
      throw new Error("The shift amount needs to be positive!")
    
    else if amount is 0
      return this
    
    zeros = []
    zeros[i] = 0 for i in [0..(amount-1)]
    @digits = zeros.join(@getDigits())
    
    return null

# ----------------------------
  shiftRightFor: (otherNumber) ->
# ----------------------------
    otherNumber = BigInteger.parse(otherNumber)
    @setDigits(otherNumber.getDigits().join(@getDigits()))
    
    return null

# ----------------------------
  shiftLeft: (amount = 1) ->
# ----------------------------
    
    if amount < 0
      throw new Error("The shift amount needs to be positive!")
    
    else if amount is 0
      return null
    
    @digits = @getDigits()[amount..]
    
    return null

# ----------------------------
  shiftLeftFor: (otherNumber) ->
# ----------------------------
    otherNumber = BigInteger.parse(otherNumber)
    @digits = @getDigits().join(otherNumber.getDigits())
  
    return null