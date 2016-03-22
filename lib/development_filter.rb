class DevelopmentFilter

  def initialize(options={})
  end

  def results
    Unit.
      find_by_sql(%{
        select units.id, units.price
        from units, developments
        where (
          select count(*) from units as u
          where u.development_id = units.development_id
          and u.price <= units.price
        ) = 1
      }).uniq
  end

end

