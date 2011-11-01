class UglifyJS
  compressor: ->
    require("uglify-js").uglify
  
  parser: ->
    require("uglify-js").parser
  
  render: (content, options, callback) ->
    if typeof(options) == "function"
      callback    = options
      options     = {}
    options ||= {}
    error = null
    
    try
      ast = @parser().parse(content)
      ast = @compressor().ast_mangle(ast)
      ast = @compressor().ast_squeeze(ast)
      result = @compressor().gen_code(ast)
    catch e
      error = e
      
    callback.call(@, error, result) if callback
    
    result
    
  compress: (content) ->
    @render(content)
    
module.exports = UglifyJS
