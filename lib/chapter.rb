require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'
require 'pathname'
require 'yaml'

class Chapter
  ATTRS = %i(
    location
    name
    time
    twitter
  ).freeze

  ATTRS.each { |a| attr_reader a }

  def self.from_file(file)
    yaml = YAML.load(file.read).with_indifferent_access
    new.tap do |chapter|
      ATTRS.each do |a|
        value = yaml[a]
        chapter.instance_variable_set(:"@#{a}", value)
      end
    end
  end

  def self.all
    Pathname(__FILE__).parent.parent.join('chapters').children.map do |c|
      from_file(c)
    end.sort_by(&:name)
  end

  def path
    "/#{name.parameterize}.html"
  end
end
