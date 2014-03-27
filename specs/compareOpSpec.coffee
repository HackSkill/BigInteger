describe "Comparing Operations", ->
  
  numbers = null
  
  beforeEach ->
    numbers = [
      BigInteger.parse(0)
      BigInteger.parse(215481523)
      BigInteger.parse(-215481525)
    ]
  
  it "compares absolute numbers.", ->
    
    expectationsList =
      for0: [
        0 # 0
        1 # 215481523
        1 # -215481525
      ]

      for215481523: [
        -1 # 0
        0 # 215481523
        1 # -215481525
      ]
    
      forMinus215481525: [
        -1 # 0
        -1 # 215481523
        0 # -215481525
      ]
    
    for expectations, i in expectationsList
      for expectation, j in expectations
        expect(numbers[i].compareAbs(numbers[j])).toEqual(expectation)
  
  it "compares numbers.", ->
    
    expectationsList =
      for0: [
        0 # 0
        1 # 215481523
        -1 # -215481525
      ]

      for215481523: [
        -1 # 0
        0 # 215481523
        -1 # -215481525
      ]
    
      forMinus215481525: [
        1 # 0
        1 # 215481523
        0 # -215481525
      ]
    
    for expectations, i in expectationsList
      for expectation, j in expectations
        expect(numbers[i].compare(numbers[j])).toEqual(expectation)
  
  it "compares numbers' digit count.", ->
    
    expectationsList =
      for0: [
        0 # 0
        1 # 215481523
        1 # -215481525
      ]

      for215481523: [
        -1 # 0
        0 # 215481523
        0 # -215481525
      ]
    
      forMinus215481525: [
        -1 # 0
        0 # 215481523
        0 # -215481525
      ]
    
    for expectations, i in expectationsList
      for expectation, j in expectations
        expect(numbers[i].compareDigitCount(numbers[j])).toEqual(expectation)