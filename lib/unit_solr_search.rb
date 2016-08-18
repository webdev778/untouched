class UnitSolrSearch < SolrSearch

  def group?
    false
  end

  def show_private?
    true
  end

  def results
    self.class.result_set_class.new(
      delegate.results
    ).sort(params[:sort], params[:sort_order])
  end

end

