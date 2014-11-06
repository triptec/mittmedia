`import Ember from 'ember';`
`import startApp from '../helpers/start-app';`
`import Ember from 'ember';`

App = undefined
module "Integration - Index Page",
  setup: ->
    App = startApp()
    return

  teardown: ->
    Ember.run App, "destroy"
    return

test "Should say Widgets", ->
  visit("/").then ->
    equal find("h2#title").text(), "Widgets"
    return

  return

