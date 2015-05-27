_ = require 'lodash'
{expect} = require 'chai'

describe 'Foo', ->
  beforeEach (done) ->
    @factory 'foo', {}, (err, {@foo}) =>
      expect(err).to.not.exist
      expect(@foo).to.exist
      done()

  it 'should get a foo', (done) ->
    @api {
      method: "get"
      path: "foo/#{@foo._id}"

    }, (err, {res, body}) =>
      should.not.exist err

      {foo} = body
      should.exist foo, 'expected foo'
      @assertSubsetOf @foo, foo

      done()
