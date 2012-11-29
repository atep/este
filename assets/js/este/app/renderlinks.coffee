###*
  @fileoverview Render links via soy templates to have content contextually
  autoescaped to reduce the risk of XSS.
###
goog.provide 'este.app.renderLinks'

goog.require 'este.app.renderlinks.templates'

###*
  @param {este.app.View} view
  @param {Array.<Object>} links
  @return {string}
###
este.app.renderLinks = (view, links) ->
  json = for link in links
    title: link.title
    selected: view instanceof link.view
    href: view.createUrl link.view
  este.app.renderlinks.templates.links links: json