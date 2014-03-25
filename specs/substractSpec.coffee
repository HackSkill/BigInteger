describe "Substraction", ->
  
  a = b = c = null

  afterEach ->
    expect(a.substract(b).getData()).toEqual(c.getData())
  
  it "substracts by zero.", ->
    a = c = BigInteger.parse(875231546223)
    b = BigInteger.parse(0)
  
  it "substracts zero.", ->
    a = BigInteger.parse(0)
    b = c = BigInteger.parse(875231546223)
  
  it "substracts zero to zero.", ->
    a = b = c = BigInteger.parse(0)
  
  it "substracts two small natural Integer without carry.", ->
    a = BigInteger.parse(25461345205)
    b = BigInteger.parse(12418424752)
    c = BigInteger.parse(13042920453) # 25461345205 - 12418424752
  
  it "substracts two small natural Integer with carry.", ->
    a = BigInteger.parse(2546134520)
    b = BigInteger.parse(8523546323)
    c = BigInteger.parse(-5977411803)
  
  it "substracts two big natural Integer with different number length.", ->
    a = BigInteger.parse([37879769957, 37879769957, 15595261849])
    b = BigInteger.parse([12418424752, 25461345205])
    c = BigInteger.parse([25461345205, 12418424752, 15595261849])
  
  it "substracts two big natural Integer with carry.", ->

    a = BigInteger.parse([0, 0, 1])
    b = BigInteger.parse(1)
    c = BigInteger.parse([999999999999999, 999999999999999])
  
  it "substracts two big negative Integers.", ->
    a = BigInteger.parse(-123456789)
    b = BigInteger.parse(-111111110)
    c = BigInteger.parse(-12345679)
  
  it "makes an addition when the first Integers' sign is minus.", ->
    a = BigInteger.parse(-12345678)
    b = BigInteger.parse(98765432)
    c = BigInteger.parse(-111111110)
  
  it "makes an addition when the second Integers' sign is minus.", ->
    a = BigInteger.parse(12345678)
    b = BigInteger.parse(-98765432)
    c = BigInteger.parse(111111110)