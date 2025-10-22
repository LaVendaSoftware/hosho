class Components::Form::CountrySelect < Components::Form::Select
  def initialize(form, **options)
    options[:include_blank] = "Selecione um país..."
    options[:data] = {addresses_target: "country"}

    super(form, :country, collection: Addresses::Countries.country_name_options, **options)
  end
end
