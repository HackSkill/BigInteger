describe "Addition", ->
  
  a = b = c = null

  afterEach ->
    expect(a.add(b).isEqual(c)).toEqual(true)
  
  it "adds to zero.", ->
    a = c = BigInteger.parse(875231546223)
    b = BigInteger.parse(0)
  
  it "adds zero.", ->
    a = BigInteger.parse(0)
    b = c = BigInteger.parse(875231546223)
  
  it "adds zero to zero.", ->
    a = b = c = BigInteger.parse(0)
  
  it "adds two small natural Integer without carry.", ->
    a = BigInteger.parse(25461345205)
    b = BigInteger.parse(12418424752)
    c = BigInteger.parse(37879769957)
  
  it "adds two small natural Integer with carry.", ->
    a = BigInteger.parse(25461345205)
    b = BigInteger.parse(85235463235)
    c = BigInteger.parse(110696808440)
  
  it "adds two big natural Integer with different number length.", ->
    a = BigInteger.parse([25461345205, 12418424752, 15595261849])
    b = BigInteger.parse([12418424752, 25461345205])
    c = BigInteger.parse([37879769957, 37879769957, 15595261849])
  
  it "adds two big natural Integer with carry.", ->
    a = BigInteger.parse([9999999999999999, 9999999999999999])
    b = BigInteger.parse(1)
    c = BigInteger.parse([0, 0, 1])
  
  it "adds two big negative Integers.", ->
    a = BigInteger.parse(-123456789)
    b = BigInteger.parse(-111111110)
    c = BigInteger.parse(-234567899)
  
  it "makes a substraction when the first Integers' sign is minus.", ->
    a = BigInteger.parse(-123456789)
    b = BigInteger.parse(987654321)
    c = BigInteger.parse(864197532)
  
  it "makes a substraction when the second Integers' sign is minus.", ->
    a = BigInteger.parse(123456789)
    b = BigInteger.parse(-987654321)
    c = BigInteger.parse(-864197532)