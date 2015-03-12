mocker = require 'raml-mocker'
express = require 'express'
_ = require 'lodash'

app = express()

options = 
  files: ['./schema/api.raml']

callback = (requestsToMock) ->
    _.each requestsToMock, (reqToMock) ->
        console.dir reqToMock
        app[reqToMock.method] reqToMock.uri, (req,res) ->
            code = 200
            if reqToMock.defaultCode
                code = reqToMock.defaultCode

            res.send code ,reqToMock.mock()

mocker.generate(options, callback)

# console.dir app
server = app.listen 3000, () ->
  console.log "mock server"