`import Ember from 'ember'`

WidgetsShowView = Ember.View.extend
  didInsertElement: ()->
    console.log "didInsertElement"

`export default WidgetsShowView`
