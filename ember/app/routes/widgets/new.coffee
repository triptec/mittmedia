`import Ember from 'ember'`
`import Widget from 'mittmedia/models/widget'`

WidgetsNewRoute = Ember.Route.extend
  model: ()->
    @store.createRecord('widget')

`export default WidgetsNewRoute`
