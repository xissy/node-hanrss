# node-hanrss

A node.js module for getting blog lists from [hanrss](http://www.hanrss).

[![Build Status](https://travis-ci.org/xissy/node-hanrss.png?branch=master)](https://travis-ci.org/xissy/node-hanrss)


## Installation

Via [npm](https://npmjs.org):

    $ npm install hanrss
  

## Usage

### Load in the module
```javascript
  var hanrss = require('hanrss');
```

### Directory class
The `Directory` class loads each blogs' RSS data from 
[hanrss directory page](http://www.hanrss.com/directory/).

Currently `Directory` class supports only `popular` and `precent` types.
You can retrieve blog RSS data by type and page number. If you want to 
get all pages' blog data then just use `findByType(...)` function instead.

```javascript
  Directory.findByTypeAndPageNo('popular', 0, function(err, blogs) {
    ...
  });

  Directory.findByType('recent', function(err, blogs) {
    ...
  });
```


## License

Released under the MIT License

Copyright (c) 2013 Taeho Kim <xissysnd@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
