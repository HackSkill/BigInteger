######################
# Square:
######################

# ----------------------------
  square: ->
# ----------------------------
    
    # 0 ^ 2 = 0
    if @isZero()
      return @ZERO
    
    # 1 ^ 2 = 1
    if @isOne()
      return @ONE
    
    # TODO: implement a real square algorithm.
    return @multiply(this)