module.exports = (grunt) ->
  
  grunt.initConfig
    
    pkg: grunt.file.readJSON('package.json'),
    
    uglify:
      
      build:
        src: 'build/BigInteger.js',
        dest: 'build/BigInteger.min.js'
    
    clean:
      build: ['build/*']
    
    coffee:
      
      build:
        files:
          'build/BigInteger.js': 'build/BigInteger.coffee'
      
      test:
        files:
          'build/BigIntegerTest.js': 'build/BigIntegerTest.coffee'
    
    jasmine:
      
      test:
        src: 'build/BigIntegerTest.js'
    
    coffeelint:
      
      build: ['build/BigInteger.coffee']
      test: ['build/BigIntegerTest.coffee']
    
    concat:
      
      options:
        separator: '\n\n\n'
      
      build:
        src: [
          'src/static.coffee'
          'src/main.coffee'
          'src/testFct.coffee'
          'src/signOp.coffee'
          'src/compareOp.coffee'
          'src/add.coffee'
          'src/substract.coffee'
          'src/multiply.coffee'
          'src/divide.coffee'
          'src/square.coffee'
          'src/pow.coffee'
          'src/shift.coffee'
          'src/split.coffee'
        ]
        dest: 'build/BigInteger.coffee'
      
      test:
        src: [
          'build/BigInteger.coffee'
          'specs/parseSpec.coffee'
          'specs/testFctSpec.coffee'
          'specs/signOpSpec.coffee'
          'specs/compareOpSpec.coffee'
          'specs/addSpec.coffee'
          'specs/substractSpec.coffee'
          'specs/multiplySpec.coffee'
          'specs/divideSpec.coffee'
          'specs/squareSpec.coffee'
          'specs/powSpec.coffee'
          'specs/shiftSpec.coffee'
          'specs/splitSpec.coffee'
        ]
        dest: 'build/BigIntegerTest.coffee'
    
    
    
    grunt.loadNpmTasks 'grunt-contrib-jasmine'
    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-coffeelint'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    
    grunt.registerTask 'build', [
      'clean:build'
      'concat:build'
      'coffeelint:build'
      'coffee:build'
      'uglify:build'
    ]
    
    grunt.registerTask 'test', [
      'clean:build'
      'concat:build'
      'concat:test'
      'coffeelint:test'
      'coffee:test'
      'jasmine:test'
    ]
