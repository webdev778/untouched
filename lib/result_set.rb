class ResultSet

  def initialize(collection)
    @collection = collection
  end

  attr_reader :collection

  def sort_in_order(sort, a, b)
    case sort
    when 'suburb'
      a.development.suburb.name <=> b.development.suburb.name
    when 'price'
      a.price <=> b.price
    when 'number'
      [a.number.split('.')[0].to_i, a.number] <=> [b.number.split('.')[0].to_i, b.number]
    when 'parking'
      a.parking <=> b.parking
    when 'bedrooms'
      a.bedrooms <=> b.bedrooms
    when 'bathrooms'
      a.bathrooms <=> b.bathrooms
    when 'internal_in_meters'
      a.internal_in_meters <=> b.internal_in_meters
    when 'external_in_meters'
      a.external_in_meters <=> b.external_in_meters
    when 'aspect'
      a.aspect <=> b.aspect
    when 'price_per_m2'
      a.price_per_m2 <=> b.price_per_m2
    end
  end

  def sort(sort, sort_order='asc')
    @collection.sort do |a, b|
      if sort_order == 'desc'
        sort_in_order(sort, b, a)
      else
        sort_in_order(sort, a, b)
      end
    end
  end

end

