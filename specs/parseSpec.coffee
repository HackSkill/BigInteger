describe "Parsing", ->
  
  a = b = null

  afterEach ->
    expect(a.getData()).toEqual(b.getData())
  
  it "parses zero.", ->
    a = BigInteger.parse(0)
    b = new BigIntegerInstance()
    b.toZero()
  
  it "parses one.", ->
    a = BigInteger.parse(1)
    b = new BigIntegerInstance([1], 1)
  
  it "parses minus one.", ->
    a = BigInteger.parse(-1)
    b = new BigIntegerInstance([1], -1)
  
  it "parses a small natural integer.", ->
    a = BigInteger.parse(8752315462)
    b = new BigIntegerInstance([8752315462], 1)
  
  it "parses a small negative integer.", ->
    a = BigInteger.parse(-8752315462)
    b = new BigIntegerInstance([8752315462], -1)
  
  it "parses a big natural integer.", ->
    a = BigInteger.parse(121234567891234567)
    b = new BigIntegerInstance([234567891234567,121], 1)
  
  it "parses a big negative integer.", ->
    a = BigInteger.parse(-121234567891234567)
    b = new BigIntegerInstance([234567891234567,121], -1)