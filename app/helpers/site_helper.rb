require 'development_filter'

module SiteHelper
  def application_react_component
    react_component(
      'Application',
      developments: all_developments_as_json
    )
  end

  def all_developments_as_json
    ActiveModel::ArraySerializer.new(
      DevelopmentFilter.new.results,
      each_serializer: UnitSerializer
    ).as_json(root: false)
  end
end
