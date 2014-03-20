BigInteger =
  
  RADIX: 1000000000000000 # < Sqrt(2^52)
  RADIX_LOG10: 16
  name: "BigIntegerStatic"
  
  ZERO: BigIntegerInstance([0], 0)
  ONE: BigIntegerInstance([1], 1)
  M_ONE: BigIntegerInstance([1], -1)
  
  MAX_INT: @parse(9007199254740992)
  
  
  getSmall: (number) ->
    
    switch number
      
      when 0 then return @ZERO
      when 1 then return @ONE
      when -1 then return @M_ONE
      
      else throw new Error("The given number is not small!")
  
  parseWithSign: (number, sign) ->
    
    bigInteger = @parse(number)
    bigInteger.setSign(sign)
    
    return bigInteger
  
  parse: (number) ->
    
    if number.getName?() is "BigInteger"
      return number
    
    switch number.constructor
      
      when Array
        
        #TODO: Array needs to be verified.
        
        return new BigIntegerInstance(number, 1)
      
      when Number
        
        if number isnt number | 0
          throw new Error("A BigInteger can't be a float!")
        
        if -1 <= number <= 1
          return @getSmall(number)
        
        else
          
          if number < 0
            return new BigIntegerInstance([-number], -1)
          
          else
            return new BigIntegerInstance([number], 1)
      
      when String
        return BigIntegerInstance(@parseString(number))
