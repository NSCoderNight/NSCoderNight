require 'active_support/core_ext/hash'
require 'active_support/core_ext/string'
require 'active_support/inflector'
require 'pathname'
require 'yaml'

module FromHash
  ATTRS = [].freeze

  def initialize(hash)
    self.class::ATTRS.each do |a|
      value = hash[a]
      if cls = self.class.const_defined?(a.to_s.singularize.classify) && self.class.const_get(a.to_s.singularize.classify)
        value = Array(value).map { |v| cls.new(v) } if value.nil? || value.is_a?(Array)
      end
      instance_variable_set(:"@#{a}", value)
    end
  end

  def FromHash.included(mod)
    mod::ATTRS.each { |a| mod.send(:attr_reader, a) }
  end
end

class Chapter
  class Organizer
    ATTRS = %i(
      name
      email
      phone
      twitter
      website
    ).freeze

    include FromHash
  end

  class Meeting
    ATTRS = %i(
      name
      day
      start_time
      end_time
      location
    ).freeze

    include FromHash
  end

  ATTRS = %i(
    name
    twitter
    province
    country
    website
    websites
    organizers
    meetings
  ).freeze

  include FromHash

  def self.from_file(file)
    begin
      yaml = YAML.load(file.read).with_indifferent_access
    rescue
      raise "Unable to parse the chapter info from '#{file.relative_path_from(Pathname.pwd)}'"
    end

    new(yaml)
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
