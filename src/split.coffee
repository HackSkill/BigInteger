######################
# Split:
######################

# ----------------------------
  extractDigits: (indexList) ->
# ----------------------------
    digits = @getDigits()
    return BigInteger.parseWithSign((digits[i] for i in indexList), @getSign())