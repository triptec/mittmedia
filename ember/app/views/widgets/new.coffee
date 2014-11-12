`import Ember from 'ember'`

WidgetsNewView = Ember.View.extend
  didInsertElement: ()->
    console.log "didInsertElement", @controller.get('configuration')
    that = @
    $('#slides').sortable
      items: "> li"
      helper: "clone"
      update: (event, ui)->
        indexes = {}
        $(this).find(".item").each (index) ->
          indexes[$(this).data("id")] = index

        $(this).sortable "cancel"
        that.controller.updateSortOrder indexes
  actions:
    addSlide: ()->
      @controller.addSlide()
      #$('#slides').sortable('refresh')
`export default WidgetsNewView`
