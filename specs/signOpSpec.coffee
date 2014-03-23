describe "Sign Operations", ->
  
  numbers = null
  
  beforeEach ->
    numbers = [
      BigInteger.parse(0)
      BigInteger.parse(1)
      BigInteger.parse(-1)
      BigInteger.parse(215481523)
      BigInteger.parse(-215481525)
    ]
  
  it "negates numbers.", ->
    
    number.negate() for number in numbers
    
    expect(numbers).toEqual([
      BigInteger.parse(0) # 0
      BigInteger.parse(-1) # 1
      BigInteger.parse(1) # -1
      BigInteger.parse(-215481523) # 215481523
      BigInteger.parse(215481525) # -215481525
      ])
  
  it "gives back absolute numbers.", ->
    
    number.abs() for number in numbers
    
    expect(numbers).toEqual([
      BigInteger.parse(0) # 0
      BigInteger.parse(1) # 1
      BigInteger.parse(1) # -1
      BigInteger.parse(215481523) # 215481523
      BigInteger.parse(215481525) # -215481525
      ])