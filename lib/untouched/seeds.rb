module Untouched
  module Seeds

    class Base
      def initialize(file_path)
        @path = File.dirname(file_path)
      end
      attr_reader :path

      def asset(asset_path)
        File.open Rails.root.join(path, 'assets', asset_path)
      end

      def puts(*args)
        unless Rails.env.test?
          Kernel.puts *args
        end
      end
    end

    class Developments < Base

      def initialize(file_path)
        super(file_path)
        @data = YAML::load_file(file_path)
      end
      attr_reader :data

      def run
        data['developments'].each do |development_params|
          development = Development.create(
            development_attributes(development_params)
          )

          create_logo(development, development_params['logo'])

          development_params['photos'].each do |photo_params|
            create_photo(development, photo_params)
          end

          Units.new(path, development, development_params['units']).run

          puts "+ #{development.address}"
        end
      end

      def create_logo(development, logo_params)
        if logo_params
          development.create_logo(file: asset(logo_params['path']))
        end
      end

      def create_photo(development, photo_params)
        development.photos.create(
          caption: photo_params['caption'],
          file: asset(photo_params['path'])
        )
      end

      def find_or_create_suburb(region_name, suburb_name)
        Suburb.find_or_create_by(
          name: suburb_name,
          region: Region.find_or_create_by(name: region_name)
        )
      end

      def development_attributes(h)
        {
          development_type: h['development_type'],
          city: h['city'],
          suburb: find_or_create_suburb(h['region'], h['suburb']),
          address: h['address'],
          ready_at: h['ready_at'],
          gym: h['gym'],
          pool: h['pool'],
          spa: h['spa'],
          sauna: h['sauna'],
          steam_room: h['steam_room'],
          rooftop_deck: h['rooftop_deck'],
          has_double_glazed_windows: h['has_double_glazed_windows'],
          ceiling_height_at_living_area_in_meters: h['ceiling_height_at_living_area_in_meters'],
          deposit_percent: h['deposit_percent']
        }
      end
    end

    class Units < Base
      def initialize(path, development, data)
        super(path)
        @development = development
        @data = data
        @path = path
      end

      attr_reader :development, :data

      def run
        data.each do |unit_params|
          unit = development.units.create(unit_attributes(unit_params))


          if unit_params['views']
            unit_params['views'].each do |view_params|
              create_view(unit, view_params)
            end
          end

          if unit_params['plans']
            unit_params['plans'].each do |plan_params|
              create_plan(unit, plan_params)
            end
          end
        end
      end

      def create_view(unit, view_params)
        unit.views.create(
          caption: view_params['caption'],
          file: asset(view_params['path'])
        )
      end

      def create_plan(unit, plan_params)
        unit.plans.create(
          caption: plan_params['caption'],
          file: asset(plan_params['path'])
        )
      end

      def unit_attributes(h)
        {
          number: h['number'],
          bedrooms: h['bedrooms'],
          price: h['price'],
          bathrooms: h['bathrooms'],
          parking: h['parking'],
          internal_in_meters: h['internal_in_meters'],
          master_bedroom_in_meters: h['master_bedroom_in_meters'],
          external_in_meters: h['external_in_meters'],
          aspect: h['aspect'],
          study_nook: h['study_nook'],
          storage_cage: h['storage_cage'],
          no_stacker: h['no_stacker'],
          max_body_corporate_fee: h['max_body_corporate_fee'],
          stamp_duty: h['stamp_duty'],
          stamp_duty_savings: h['stamp_duty_savings'],
          status: h['status']
        }
      end
    end
  end
end

