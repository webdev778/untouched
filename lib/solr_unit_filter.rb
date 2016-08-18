class SolrUnitFilter < SolrFilter

  def initialize(params={})
    @params = params.merge(private: nil)
  end

  def self.search_class
    UnitSolrSearch
  end

end

