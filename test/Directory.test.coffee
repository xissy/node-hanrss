should = require 'should'

Directory = require '../lib/Directory'


describe 'Directory', ->

  describe 'by popular type', ->
    describe 'with pageNo', ->
      it 'should be done', (done) ->
        Directory.findByTypeAndPageNo 'popular', 0, (err, blogs) ->
          should.not.exist err
          should.exist blogs
          blogs.should.have.length 20
          done()

    describe 'all pages', ->
      it 'should be done', (done) ->
        Directory.findByType 'popular', (err, blogs) ->
          should.not.exist err
          should.exist blogs
          blogs.should.have.length 1000
          done()


  describe 'by recent type', ->
    describe 'with pageNo', ->
      it 'should be done', (done) ->
        Directory.findByTypeAndPageNo 'recent', 0, (err, blogs) ->
          should.not.exist err
          should.exist blogs
          blogs.should.have.length 20
          done()

    describe 'all pages', ->
      it 'should be done', (done) ->
        Directory.findByType 'recent', (err, blogs) ->
          should.not.exist err
          should.exist blogs
          blogs.should.have.length 100
          done()