######################
# Sign Operations:
######################

# ----------------------------
  negate: ->
# ----------------------------
    return @setSign(-@getSign())

# ----------------------------
  abs: ->
# ----------------------------
    if @getSign() is 1
      return this
    
    else
      return @negate()
