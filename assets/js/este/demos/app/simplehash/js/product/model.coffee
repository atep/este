###*
  @fileoverview este.demos.app.simplehash.product.Model.
###
goog.provide 'este.demos.app.simplehash.product.Model'

goog.require 'este.Model'

class este.demos.app.simplehash.product.Model extends este.Model

  ###*
    @param {Object=} json
    @param {Function=} idGenerator
    @constructor
    @extends {este.Model}
  ###
  constructor: (json, idGenerator) ->
    super json, idGenerator

  ###*
    @override
  ###
  schema:
    'name':
      'set': este.model.setters.trim
      'validators':
        'required': este.model.validators.required
    'description':
      'set': este.model.setters.trim
      'validators':
        'required': este.model.validators.required