class CoffeeScript
  engine: -> require('coffee-script')
  
  render: (content, options, callback) ->
    result        = ""
    if typeof(options) == "function"
      callback    = options
      options     = {}
    options ?= {}
    
    options.bare  = true unless options.hasOwnProperty("bare")
    try
      result      = @engine().compile(content, options)
    catch e
      result      = null
      error       = e
    
    callback.call(@, error, result) if callback
    
    result
    
exports = module.exports = CoffeeScript
