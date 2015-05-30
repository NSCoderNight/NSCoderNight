require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'
require 'pathname'
require 'yaml'

class Chapter
  ATTRS = %i(
    location
    name
    meeting_time
    twitter
    province
    country
    website
    day
    organizer_name
    organizer_email
  	organizer_twitter
  	organizer_website
  ).freeze

  ATTRS.each { |a| attr_reader a }

  def self.from_file(file)
    begin
      yaml = YAML.load(file.read).with_indifferent_access
    rescue
      raise "Unable to parse the chapter info from '#{file.relative_path_from(Pathname.pwd)}'"
    end

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
    "/#{name.parameterize}"
  end
end
