Development.destroy_all

Untouched::Seeds::Developments.new(
  Rails.root.join(*%w(db seeds developments.yml)).to_s
).run

