`import Ember from 'ember'`

WidgetsShowView = Ember.View.extend
  didInsertElement: ()->
    console.log "didInsertElement"
    console.log $('#slides').sortable()
`export default WidgetsShowView`
