require 'rails_helper'
require 'solr_development_filter'

describe SolrDevelopmentFilter, search: true do
  context "with no options" do
    subject { SolrDevelopmentFilter.new }
    let!(:development_1) { create(:development, photo: nil) }
    let!(:development_2) { create(:development, photo: nil) }
    # Not sure why I have to explicitly reindex units here...
    before { Unit.reindex }

    it "returns one item for each development" do
      expect(subject.results.length).to eq(2)
    end

    describe "the first development result" do
      let(:least_expensive_unit) { development_1.units.order('price ASC').first }
      it "returns the least expensive unit" do
        expect(subject.results).to include(least_expensive_unit)
      end
    end

    describe "the second development result" do
      let(:least_expensive_unit) { development_2.units.order('price ASC').first }
      it "returns the least expensive unit" do
        expect(subject.results).to include(least_expensive_unit)
      end
    end
  end

  context "when sorting by suburb" do
    let(:suburbs) { [ "Bellevue", "Tacoma", "Everett" ].map {|name| create(:suburb, name: name) } }
    let!(:developments) { suburbs.map {|s| create(:development, photo: nil, suburb: s) } }
    before { Unit.reindex }

    context "in ascending order" do
      subject { SolrDevelopmentFilter.new(sort: 'suburb', sort_order: 'asc') }
      it "sorts them in alphabetical order by suburb" do
        expect(subject.results.map(&:development).map(&:suburb).map(&:name)).
          to eq([ 'Bellevue', 'Everett', 'Tacoma' ])
      end
    end

    context "in descending order" do
      subject { SolrDevelopmentFilter.new(sort: 'suburb', sort_order: 'desc') }
      it "sorts them in alphabetical order by suburb" do
        expect(subject.results.map(&:development).map(&:suburb).map(&:name)).
          to eq([ 'Bellevue', 'Everett', 'Tacoma' ].reverse)
      end
    end
  end

  context "when sorting by price" do
    let!(:developments) { (0..2).map { create(:development, photo: nil) } }
    before { Unit.reindex }

    context "in ascending order" do
      subject { SolrDevelopmentFilter.new(sort: 'price', sort_order: 'asc') }
      it "sorts them in ascending order by price" do
        expect(subject.results.map(&:price)).
          to eq(developments.map {|d| d.units.order('price ASC').first.price}.sort)
      end
    end

    context "in descending order" do
      subject { SolrDevelopmentFilter.new(sort: 'price', sort_order: 'desc') }
      it "sorts them in descending order by price" do
        expect(subject.results.map(&:price)).
          to eq(developments.map {|d| d.units.order('price ASC').first.price}.sort.reverse)
      end
    end
  end


  context "with ready date specified" do
    let(:q4_2017) { Time.parse("November 1, 2017") }
    let!(:development) { create(:development, units_count: 0, photo: nil, ready_at: q4_2017) }
    let!(:unit) { create(:unit, bedrooms: 1, development: development) }
    before { Unit.reindex }

    subject { SolrDevelopmentFilter.new(filter_params) }

    context "with a development that will be ready 2017 Q4" do
      context "when querying all developments ready before 2018 Q1" do
        let(:filter_params) { { ready_at: Time.parse("Jan 1, 2018") } }
        it "returns the development" do
          expect(subject.results).to include(unit)
        end
      end

      context "when querying all developments ready before 2017 Q1" do
        let(:filter_params) { { ready_at: Time.parse("Jan 1, 2017") } }
        it "doesn't return the development" do
          expect(subject.results).not_to include(unit)
        end
      end
    end
  end

  context "with number of bedrooms specified" do
    let!(:development) { create(:development, units_count: 0, photo: nil) }
    let!(:one_bedroom_unit) { create(:unit, bedrooms: 1, development: development) }
    let!(:two_bedroom_unit) { create(:unit, bedrooms: 2, development: development) }
    before { Unit.reindex }

    context "when 1 bedroom is specified" do
      subject { SolrDevelopmentFilter.new(bedrooms: '1') }

      it "returns the one-bedroom unit" do
        expect(subject.results).to include(one_bedroom_unit)
      end
    end

    context "when 4 or more bedrooms are specified" do
      subject { SolrDevelopmentFilter.new(bedrooms: '4+') }

      context "and there's only a 4-bedroom unit" do
        let!(:four_bedroom_unit) { create(:unit, bedrooms: 4, development: development) }
        it "returns the four-bedroom unit" do
          expect(subject.results).to include(four_bedroom_unit)
        end
      end

      context "and there's only a 5-bedroom unit" do
        let!(:five_bedroom_unit) { create(:unit, bedrooms: 5, development: development) }
        it "returns the five-bedroom unit" do
          expect(subject.results).to include(five_bedroom_unit)
        end
      end

    end

    context "when 3, and 4 or more bedrooms are specified" do
      subject { SolrDevelopmentFilter.new(bedrooms: [ '3', '4+' ]) }

      context "and there's only a 1- and 2-bedroom unit" do
        it "returns nothing" do
          expect(subject.results).to be_empty
        end
      end

      context "and there's only a 3-bedroom unit" do
        let!(:three_bedroom_unit) { create(:unit, bedrooms: 3, development: development) }
        before { Unit.reindex }

        it "only has one result" do
          expect(subject.results.length).to eq(1)
        end

        it "returns the three-bedroom unit" do
          expect(subject.results).to include(three_bedroom_unit)
        end
      end

      context "and there's only a 4-bedroom unit" do
        let!(:four_bedroom_unit) { create(:unit, bedrooms: 4, development: development) }
        before { Unit.reindex }
        it "returns the four-bedroom unit" do
          expect(subject.results).to include(four_bedroom_unit)
        end
      end

    end
  end

  describe "facets" do
    context "with one development" do
      subject { SolrDevelopmentFilter.new }
      let!(:development_1) { create(:development, photo: nil) }
      let!(:development_2) { create(:development, photo: nil) }
      before { Unit.reindex }

      describe "the bathrooms facet" do
        it "has a row for 1 bathroom units" do
          p subject.facet(:bathrooms).rows.first
        end
      end
    end
  end
end

