module Humanizable
  extend ActiveSupport::Concern

  included do
    def human_enum_name(name, count: 1)
      return if try(name).blank?

      self.class.human_attribute_name("#{name.to_s.pluralize}.#{try(name)}", count:)
    end

    def human_enum_plural_name(name)
      human_enum_name(name, count: 2)
    end

    def human_enum_singular_name(name)
      human_enum_name(name, count: 1)
    end
  end
end
