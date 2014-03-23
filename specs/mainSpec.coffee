describe "Main functions", ->
  
  # Notice: BigIntegers are here initialized with (new BigIntegerInstance())
  # only for the purpose of independance between the main function tests and
  # the parsing tests. Please use in your code (BigInteger.parse()) to
  # initialize your BigIntegers.
  
  it "says it is a BigInteger.", ->
    a = new BigIntegerInstance()
    expect(a.getName()).toEqual("BigInteger")
  
  it "makes zero.", ->
    a = BigInteger.getZero()
    b = (new BigIntegerInstance()).toZero()
    expect(a.getData()).toEqual(b.getData())
  
  it "clones.", ->
    a = new BigIntegerInstance([124523,24532545], -1)
    b = a.clone()
    expect(a.getData()).toEqual(b.getData())
  
  it "gets ZERO.", ->
    a = new BigIntegerInstance()
    expect(a.ZERO().getData()).toEqual(BigInteger.getZero().getData())
  
  it "gets ONE.", ->
    a = new BigIntegerInstance()
    b = new BigIntegerInstance([1], 1)
    expect(a.ONE().getData()).toEqual(b.getData())
  
  it "gets M_ONE.", ->
    a = new BigIntegerInstance()
    b = new BigIntegerInstance([1], -1)
    expect(a.M_ONE().getData()).toEqual(b.getData())
  
  it "gets RADIX.", ->
    a = new BigIntegerInstance()
    expect(a.RADIX()).toEqual(BigInteger.RADIX)
  
  it "gets the number's sign.", ->
    a = new BigIntegerInstance([124523,24532545], -1)
    expect(a.getSign()).toEqual(-1)
  
  it "gets the number's digits.", ->
    a = new BigIntegerInstance([124523,24532545], -1)
    expect(a.getDigits()).toEqual([124523,24532545])
  
  it "gets the number's digits count.", ->
    a = new BigIntegerInstance([124523,24532545], -1)
    expect(a.getDigitCount()).toEqual(2)
  
  it "gets the number's data.", ->
    a = new BigIntegerInstance([124523,24532545], -1)
    expect(a.getData()).toEqual([[124523,24532545], -1])
  
  it "returns a small integer.", ->
    a = new BigIntegerInstance([124523], -1)
    expect(a.getInteger()).toEqual(-124523)
  
  it "sets the number's sign.", ->
    a = new BigIntegerInstance([124523], -1)
    
    a.setSign(1)
    expect(a.getSign()).toEqual(1)
    
    a.setSign(-1)
    expect(a.getSign()).toEqual(-1)

  it "rejects 0 as a sign for a non-null number.", ->
    a = new BigIntegerInstance()
    
    try
      a.setSign(0)
    catch e
      error = e
    
    expect(error).not.toBeUndefined()
  
  it "sets the number's digits.", ->
    a = new BigIntegerInstance([124523], -1)
    
    a.setDigits([124523, 26262462])
    expect(a.getDigits()).toEqual([124523, 26262462])
  
  it "rejects non-valid digits as digits for a number.", ->
    a = new BigIntegerInstance()
    
    try
      a.setDigits([5952631856249562]) # > Radix
    catch e
      error = e
    
    expect(error).not.toBeUndefined()