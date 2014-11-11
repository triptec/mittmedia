`import startApp from '../helpers/start-app';`
`import Ember from 'ember';`

App = undefined
server = undefined
module "Integration - Widgets Page",
  setup: ->
    App = startApp()
    widgets = [
      {
        id: 1
        title: "Allehanda widget"
        type: "widget"
        data: ""
      }
      {
        id: 2
        title: "ST widget"
        type: "widget"
        data: ""
      }
    ]
    server = new Pretender(->
      @get "/api/v1/widgets", (request) ->
        [
          200
          {
            "Content-Type": "application/json"
          }
          JSON.stringify(widgets: widgets)
        ]

      @get "/api/v1/widgets/:id", (request) ->
        widget = widgets.find((widget) ->
          widget if widget.id is parseInt(request.params.id, 10)
        )
        [
          200
          {
            "Content-Type": "application/json"
          }
          JSON.stringify(widget: widget)
        ]

      return
    )
    return

  teardown: ->
    Ember.run App, "destroy"
    server.shutdown()
    return

test "Should list all widgets", ->
  visit("/widgets").then ->
    equal find("a:contains(\"Allehanda widget\")").length, 1
    equal find("a:contains(\"ST widget\")").length, 1
    return

  return

test "Should be able to navigate to a show widget page", ->
  visit("/widgets").then ->
    click("a:contains(\"Allehanda widget\")").then ->
      equal find("h4").text(), "Allehanda widget"
      return

    return

  return

test "Should be able visit a widget page", ->
  visit("/widgets/1").then ->
    equal find("h4").text(), "Allehanda widget"
    return

  return

