`import startApp from '../helpers/start-app';`
`import Ember from 'ember';`

App = undefined
server = undefined
module "Integration - Index Page",
  setup: ->
    App = startApp()
    server = new Pretender(->
      @get "/api/v1/widgets", (request) ->
        [
          200
          {
            "Content-Type": "application/json"
          }
          JSON.stringify(widgets: [])
        ]
      return
    )
    return

  teardown: ->
    Ember.run App, "destroy"
    server.shutdown()
    return

test "Should welcome me to Widgets", ->
  visit("/").then ->
    equal find("h2#title").text(), "Welcome to Widgets"
    return

  return

test "Should allow navigation to the widgets page from the index page", ->
  visit("/").then ->
    click("a:contains(\"Widgets\")").then ->
      equal find("h3").text(), "Widgets"
      return

    return

  return
