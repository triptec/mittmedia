`import Ember from 'ember'`

WidgetsRoute = Ember.Route.extend(
  model: ->
    @store.find "widget"
)

`export default WidgetsRoute`
