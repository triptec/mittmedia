`import Ember from 'ember'`
WidgetsFormController = Ember.ObjectController.extend
  slidesController: Ember.ArrayController.create
    sortProperties: ['sort_order']
    sortAscending: true

  modelLoaded: (->
    console.log "ModelLoaded",@get('model.isLoaded')
    if @get('model.isLoaded')
      slides = @get('model.configurationData.slides')
      if slides
        @set('slidesController.model', slides)
        return
      @set('slidesController.model', [])
  ).observes('model.isLoaded')
  
  updateSortOrder: (indexes)->
    @slidesController.propertyWillChange('model')
    @slidesController.forEach(
      (item)->
        index = indexes[item.get('id')]
        item.set('sort_order', index);
    ,@slidesController)
    @slidesController.propertyDidChange('model')

  addSlide: ()->
    slide = Ember.Object.create
      id: "slide_#{@get('slidesController.length')}"
      img: "http://lorempixel.com/400/200/people/"
      text: "text"
      sort_order: @get('slidesController.length')
    @get('slidesController').pushObject(slide)

  actions:
    save: ()->
      model = @get('model')
      data = JSON.stringify({slides: @get('slidesController').toArray()})
      model.set('configurationData', data)
      model.save()

`export default WidgetsFormController`
