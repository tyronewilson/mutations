require 'rspec/expectations'

RSpec::Matchers.define :have_required_field do
  match do |actual|
    actual.input_filters.required_keys.include? expected
  end

  failure_message do
    "Expected #{actual} to have required field `:#{expected}`"
  end
end

RSpec::Matchers.define :have_optional_field do
  match do |actual|
    actual.input_filters.optional_keys.include? expected
  end

  failure_message do
    "Expected #{actual} to have optional field `:#{expected}`"
  end
end

RSpec::Matchers.define :have_required_fields do
  match do |actual|
    @missing_keys = expected.sort - actual.input_filters.required_keys.sort & expected.sort
    @missing_keys.none?
  end

  failure_message do
    %Q{
      Expected #{actual} to have required keys:
      #{expected}

      MISSING:
      #{@missing_keys}
    }
  end
end

RSpec::Matchers.define :have_optional_fields do
  match do |actual|
    @missing_keys = expected.sort - actual.input_filters.optional_keys.sort & expected.sort
    @missing_keys.none?
  end

  failure_message do
    %Q{
      Expected #{actual} mutation to have optional keys:
      #{expected}

      MISSING:
      #{@missing_keys}
    }
    end
end
