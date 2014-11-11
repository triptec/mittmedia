`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend(
  location: config.locationType
)
Router.map ->
  @resource('widgets',->
    @route('show', {path: ':widget_id'})
    @route('new')
  )

`export default Router;`
