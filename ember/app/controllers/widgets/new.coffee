`import Ember from 'ember'`
WidgetsNewController = Ember.ObjectController.extend
  init: ()->
    console.log @get('model.configurationData')

  configuration: Ember.Object.create({slides:[]})

  slidesController: Ember.ArrayController.create
    sortProperties: ['sort_order']
    sortAscending: true

  slides: (->
    slides = @get('model.configurationData.slides')
    unless slides
      slides = []
    @set('slidesController.model', slides)
    @get('slidesController')
  ).property('model.configurationData')

  updateSortOrder: (indexes)->
    @slidesController.beginPropertyChanges()
    @slidesController.forEach(
      (item)->
        index = indexes[item.get('id')]
        item.set('sort_order', index);
    ,@slidesController)
    @slidesController.endPropertyChanges()

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

`export default WidgetsNewController`
