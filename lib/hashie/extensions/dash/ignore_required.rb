module Hashie
  module Extensions
    module Dash
      # IgnoreRequired is a mixin that silently ignores required properties
      # on initialization and assignment instead of raising an error. This
      # is useful when building an object that will eventually match a Dash
      # but is temporarily incomplete, for example, an intermediate "builder"
      # object.
      #
      # @example
      #   class Person < Hashie::Dash
      #     property :first_name, required: true
      #     property :last_name, required: true
      #     property :email
      #   end
      #
      #   class PartialPerson < Person
      #     include Hashie::Extensions::Dash::IgnoreRequired
      #   end
      #
      #   user_data = { first_name: 'Freddy' }
      #
      #   Person.new(user_data)
      #   # => ArgumentError: The property 'last_name' is required for Person.
      #
      #   person = PartialPerson.new(user_data)
      #   person.last_name = 'Nostrils'
      #   person.first_name # => 'Freddy'
      #   person.last_name  # => 'Nostrils'
      #   person.email      # => nil
      module IgnoreRequired
        def assert_property_required!(_property, _value)
          # do nothing
        end

        def assert_property_set!(_property)
          # do nothing
        end
      end
    end
  end
end
