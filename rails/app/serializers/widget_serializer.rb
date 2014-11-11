class WidgetSerializer < ActiveModel::Serializer
  attributes :id, :type, :title, :configuration_data
end
