class SolrFilter

  def initialize(params={})
    @params = params
  end

  attr_reader :params

  def results
    search.results
  end

  def search
    @search ||= self.class.search_class.new(params)
  end

  def facets
    search.facets
  end

  def self.search_class
    SolrSearch
  end

end
