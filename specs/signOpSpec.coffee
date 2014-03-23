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
    
    expectations = [
      BigInteger.parse(0) # 0
      BigInteger.parse(-1) # 1
      BigInteger.parse(1) # -1
      BigInteger.parse(-215481523) # 215481523
      BigInteger.parse(215481525) # -215481525
    ]
    
    number.negate() for number in numbers
    
    for expectation, i in expectations
      expect(numbers[i].getData()).toEqual(expectation.getData())
  
  it "gives back absolute numbers.", ->
    
    expectations = [
      BigInteger.parse(0) # 0
      BigInteger.parse(1) # 1
      BigInteger.parse(1) # -1
      BigInteger.parse(215481523) # 215481523
      BigInteger.parse(215481525) # -215481525
    ]
    
    number.abs() for number in numbers
      
    for expectation, i in expectations
      expect(numbers[i].getData()).toEqual(expectation.getData())