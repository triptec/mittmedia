`import DS from 'ember-data'`

Widget = DS.Model.extend {
  title: DS.attr()
  type: DS.attr()
  configurationData: DS.attr()
}

`export default Widget`
