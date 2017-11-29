# Untouched.co

## Seeding Data

Untouched includes a custom data seed mechanism which uses
[YAML](http://yaml.org/) to specify development data. This will help us get to
a working MVP faster by providing us with a way to batch-import development
data.

To get started, edit the file `db/seeds/developments.yml`. In that file you'll
find an example development with a couple units.

### Seeding Image Assets

Untouched has four main types of image assets associated with developments
and units:

* **DevelopmentLogo**: The logo image which appears in the upper-right-hand
corner of each unit page for the development.
* **DevelopmentPhoto**: Any number of photos and captions to appear on the
development page.
* **UnitView**: Any number of photos and captions to appear on the unit detail
page.
* **UnitPlan**: Any number of blueprints and captions to appear on the unit
detail page.

You'll notice each of these are represented as separate lists in the YAML
specification.

### Running seeds

**Note that running the seed script at this time is a destructive operation
and will destroy all existing developments and units!**

To seed the database, run:

		$ rake db:seed

