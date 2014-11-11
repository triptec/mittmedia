`import Ember from 'ember'`

WidgetsNewController = Ember.ObjectController.extend
  init: ()->
    console.log @get('model.configurationData')
  configuration: Ember.Object.create({slides:[]})
  slides: (->
    slides = @get('configuration.slides')
    return [] unless slides
    slides
  ).property('configuration.slides')
  actions:
    save: ()->
      console.log JSON.stringify(@get('configuration'))

    addSlide: ()->
      slide = Ember.Object.create({img: "http://lorempixel.com/400/200/people/", text:"text"})
      @get('configuration.slides').pushObject(slide)
`export default WidgetsNewController`
