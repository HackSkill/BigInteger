describe "Product", ->
  
  a = b = c = null

  afterEach ->
    expect(a.multiply(b).getData()).toEqual(c.getData())
  
  it "multiplies by zero.", ->
    a = BigInteger.parse(875231546223)
    b = c = BigInteger.parse(0)
  
  it "multiplies zero.", ->
    a = c = BigInteger.parse(0)
    b = BigInteger.parse(875231546223)
  
  it "multiplies zero to zero.", ->
    a = b = c = BigInteger.parse(0)
  
  it "multiplies by one.", ->
    a = c = BigInteger.parse(875231546223)
    b = BigInteger.parse(1)
  
  it "multiplies one.", ->
    a = BigInteger.parse(1)
    b = c = BigInteger.parse(875231546223)
  
  it "multiplies one to one.", ->
    a = b = c = BigInteger.parse(1)
  
  it "multiplies two small natural Integer without carry.", ->
    a = BigInteger.parse(12545)
    b = BigInteger.parse(128)
    c = BigInteger.parse(1605760) # 12545 * 128
  
  it "multiplies two small natural Integer with carry.", ->
    a = BigInteger.parse(25461345)
    b = BigInteger.parse(85235464)
    c = BigInteger.parse([170209555139080, 2])
  
  it "multiplies two big natural Integer with carry.", ->
    a = BigInteger.parse([251245245284815, 152145214521])
    b = BigInteger.parse([177557858755817, 15852549525914])
    c = BigInteger.parse([
      778881703018855,
      278478342589918,
      328972270869732,
      2411889548
      ])
  
  it "multiplies two negative Integers.", ->
    a = BigInteger.parse(-25461345)
    b = BigInteger.parse(-85235464)
    c = BigInteger.parse([170209555139080, 2])
  
  it "multiplies two Integers of different sign.", ->
    a = BigInteger.parse(-25461345)
    b = BigInteger.parse(85235464)
    c = BigInteger.parseWithSign([170209555139080, 2], -1)
  