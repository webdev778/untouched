class ResultSet

  def initialize(collection)
    @collection = collection
  end

  attr_reader :collection

  def sort(sort, sort_order='asc')
    @collection.sort do |a, b|
      if sort_order == 'desc'
        if sort == 'suburb'
          b.development.suburb.name <=> a.development.suburb.name
        else
          b.price <=> a.price
        end
      else
        if sort == 'suburb'
          a.development.suburb.name <=> b.development.suburb.name
        else
          a.price <=> b.price
        end
      end
    end
  end

end

