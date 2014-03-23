describe "Test Functions", ->
  
  numbers = null
  
  beforeEach ->
    numbers = [
      BigInteger.parse(0)
      BigInteger.parse(1)
      BigInteger.parse(-1)
      BigInteger.parse(215481523)
      BigInteger.parse(-215481525)
      BigInteger.parse(215481520)
      BigInteger.parse(-215481524)
    ]
  
  it "tests if a number is ZERO.", ->
    
    expectations = [
      true # 0
      false # 1
      false # -1
      false # 215481523
      false # -215481525
      false # 215481520
      false # -215481524
    ]
    
    result = (number.isZero() for number in numbers)
    
    for expectation, i in expectations
      expect(result[i]).toEqual(expectation)
  
  it "tests if a number is positive.", ->
    
    expectations = [
      false # 0
      true # 1
      false # -1
      true # 215481523
      false # -215481525
      true # 215481520
      false # -215481524
      ]
    
    result = (number.isPositive() for number in numbers)
    
    for expectation, i in expectations
      expect(result[i]).toEqual(expectation)
  
  it "tests if a number is negative.", ->
    
    expectations = [
      false # 0
      false # 1
      true # -1
      false # 215481523
      true # -215481525
      false # 215481520
      true # -215481524
      ]
    
    result = (number.isNegative() for number in numbers)
    
    for expectation, i in expectations
      expect(result[i]).toEqual(expectation)
  
  it "tests if a number is a unit.", ->
    
    expectations = [
      false # 0
      true # 1
      true # -1
      false # 215481523
      false # -215481525
      false # 215481520
      false # -215481524
      ]
    
    result = (number.isUnit() for number in numbers)
    
    for expectation, i in expectations
      expect(result[i]).toEqual(expectation)
  
  it "tests if a number is ONE.", ->
    
    expectations = [
      false # 0
      true # 1
      false # -1
      false # 215481523
      false # -215481525
      false # 215481520
      false # -215481524
      ]
    
    result = (number.isOne() for number in numbers)
    
    for expectation, i in expectations
      expect(result[i]).toEqual(expectation)
  
  it "tests if a number is M_ONE.", ->
    
    expectations = [
      false # 0
      false # 1
      true # -1
      false # 215481523
      false # -215481525
      false # 215481520
      false # -215481524
      ]
    
    result = (number.isMinusOne() for number in numbers)
    
    for expectation, i in expectations
      expect(result[i]).toEqual(expectation)
  
  it "tests if a number is even.", ->
    
    expectations = [
      true # 0
      false # 1
      false # -1
      false # 215481523
      false # -215481525
      true # 215481520
      true # -215481524
      ]
    
    result = (number.isEven() for number in numbers)
    
    for expectation, i in expectations
      expect(result[i]).toEqual(expectation)
  
  it "tests if a number is odd.", ->
    
    expectations = [
      false # 0
      true # 1
      true # -1
      true # 215481523
      true # -215481525
      false # 215481520
      false # -215481524
      ]
    
    result = (number.isOdd() for number in numbers)
    
    for expectation, i in expectations
      expect(result[i]).toEqual(expectation)
  
  it "tests if a number is equal to another.", ->
    
    expectations = [
      false # 0
      false # 1
      false # -1
      true # 215481523
      false # -215481525
      false # 215481520
      false # -215481524
      ]
    
    result = (number.isEqual(215481523) for number in numbers)
    
    for expectation, i in expectations
      expect(result[i]).toEqual(expectation)
  