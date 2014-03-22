#Big Integer:

*This library is still in development and hasn't reach a stade of release.*

Have you ever written a javascript app and got to make some heavy math calculation? Did you have to change plans, because javascript only supports numbers smaller than 2^53 ? Well fear no more my dear fellow, for I have brought to you a library to help you on your quest!

This little library should allow you to manipulate numbers far above the initial Integer max-value set by javascript. For your convinience it includes also a set of common math operation:

* addition
* substraction
* product
* division
* modulo
* pow

## How to use:

Download `/build/BigInteger.js` or `/build/BigIntegerin.js` from this repository.

For client-side in HTML:

```
<script src="./path/to/BigInteger.js"></script>
or
<script src="./path/to/BigInteger.min.js"></script>

...

<script>
  var a = BigInteger.parse('1752345315856214862486214'),
  b = BigInteger.parse('a584ef');
  
  // raises a to the power of 875 and modulo b
  alert(a.modPow(875, b).toString());
</script>
```

## Dependencies:

None!

## How to build:

*Note that this process is for developers who want to enhance this library. If you only want to use it please read the 'How to use' section.* 

To build the librairy you need nodeJS and npm.

Run:
```
clone https://github.com/HackSkill/BigInteger.git
cd BigInteger
npm install
grunt build
```

## License:

  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.