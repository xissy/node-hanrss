# A node.js module for getting blogs from [hanrss](http://www.hanrss)

The `Directory` class loads each blogs' RSS data from 
[hanrss directory page](http://www.hanrss.com/directory/).


## Dependencies
This class uses `async` to process asyncrous jobs, `request` to load HTML and 
`cheerio` to parse & extract tags info.

    async = require 'async'
    request = require 'request'
    cheerio = require 'cheerio'
    querystring = require 'querystring'


## Class

    class Directory


### Get blog info by type or page no

    Directory.findByTypeAndPageNo = (type, pageNo, callback) ->
      url = "http://www.hanrss.com/directory/index.qst?show=#{type}&pno=#{pageNo}"
      
      request url, (err, response, body) ->
        return callback err  if err?

        $ = cheerio.load body

Unusully, hanrss doesn't have any element id or classname at their html tags.
So we have to the tags what we need in manual.

        blogsTr = $('table').eq(6).find('table table table')
        
        blogs = []
        blogsTr.each (i, element) ->
          thisElement = $(this)
          trs = thisElement.find('tr')

If hanrss changed their tag structure then we may fix below parsing part.

          blogs.push
            title: trs.eq(0).text()
            desc: trs.eq(1).text()
            subscriberCount: Number trs.eq(2).find('.verdana').text()
            rssUrl: querystring.unescape trs.eq(2).find('a').eq(1).attr('href').split('=')[1]

        callback null, blogs


### Get all of blog info by type

    Directory.findByType = (type, callback) ->

Currently supports `popular` and `recent` type only.
The limit of Popular RSS is 1000 and Recent Rss is 100.

      startPageNo = 0
      if type is 'popular'
        endPageNo = 49  
      else if type is 'recent'
        endPageNo = 4
      else
        return callback new Error "Type should be 'popular' or 'recent' only"

Using `Directory.findByTypeAndPageNo(...)` function internally.

      async.map [startPageNo..endPageNo]
      ,
        (pageNo, callback) ->
          Directory.findByTypeAndPageNo type, pageNo, callback
      ,
        (err, blogLists) ->
          return callback err  if err?

          blogs = []
          for blogList in blogLists
            for blog in blogList
              blogs.push blog

          callback null, blogs


## Publicy

    module.exports = Directory
