###*
  @fileoverview este.app.View.
###
goog.provide 'este.app.View'
goog.provide 'este.app.View.Event'
goog.provide 'este.app.View.EventType'

goog.require 'este.Base'
goog.require 'goog.dom'
goog.require 'goog.events.Event'

class este.app.View extends este.Base

  ###*
    @constructor
    @extends {este.Base}
  ###
  constructor: ->
    super

  ###*
    @enum {string}
  ###
  @EventType:
    LOAD: 'load'

  ###*
    for example 'detail/:id'
    @type {?string}
  ###
  url: null

  ###*
    @type {Element}
    @protected
  ###
  element: null

  ###*
    Called from app load.
    @param {Function} done
    @param {Object=} params
  ###
  load: (done, params) ->
    # async load example
    # @storage.loadUser params['id'], (user) ->
    #   done user
    # , @fireError()?
    done()

  ###*
    Called from app onRequestLoad just before layout show.
    todo: consider renaming to parse
    @param {Object} json
  ###
  onLoad: (json) ->
    @render json

  ###*
    Override to render view content.
    @param {Object} json
    @protected
  ###
  render: (json) ->
    # innerHTML = template + viewModel

  ###*
    Override to register events or instantiate short livings object.
  ###
  enterDocument: ->

  ###*
    Override to dispose what were registered or instantied in enterDocument
  ###
  exitDocument: ->
    @getHandler().removeAll()

  ###*
    @return {Element}
  ###
  getElement: ->
    @element ?= document.createElement 'div'

  ###*
    @param {function(new:este.app.View)} viewClass
    @param {Object=} params
    @protected
  ###
  dispatchLoadEvent: (viewClass, params) ->
    event = new este.app.View.Event viewClass, params
    @dispatchEvent event

  ###*
    @inheritDoc
  ###
  disposeInternal: ->
    @exitDocument()
    goog.dom.removeNode @element if @element
    super
    return

class este.app.View.Event extends goog.events.Event

  ###*
    @param {function(new:este.app.View)} viewClass
    @param {Object=} params
    @constructor
    @extends {goog.events.Event}
  ###
  constructor: (@viewClass, @params = null) ->
    super este.app.View.EventType.LOAD

  ###*
    @type {?function(new:este.app.View)}
  ###
  viewClass: null

  ###*
    @type {Object}
  ###
  params: null