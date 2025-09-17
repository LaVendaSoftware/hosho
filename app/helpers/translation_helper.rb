module TranslationHelper
  ##
  # Public: Translate a model name.
  #
  # model: Model class.
  # count: Count.
  #
  # Examples:
  #
  #   <%= tm(Post) %>
  #   # => "Artigo"
  #
  #   <%= tm(Post, 2) %>
  #   # => "Artigos"
  #
  # Returns translated model.
  def translate_model_name(model, count = 1)
    model.model_name.human(count:)
  end
  alias_method :tm, :translate_model_name

  ##
  # Public: Translate a model name pluralized.
  #
  # model: Model class.
  #
  # Examples:
  #
  #   <%= tmp(Post) %>
  #   # => "Artigos"
  #
  # Returns translated model pluralized.
  def translate_model_name_pluralized(model)
    translate_model_name(model, 2)
  end
  alias_method :tmp, :translate_model_name_pluralized

  ##
  # Public: Translate a model submit button.
  #
  # model: Model class.
  #
  # Examples:
  #
  #   <%= tmb(Post, :create) %>
  #   => <button name="button" type="submit" class="btn btn-primary">
  #   =>   <i class="bi bi-save2"> </i>Criar Artigo
  #   => </button>
  #
  #   <%= tmb(Post, :update) %>
  #   => <button name="button" type="submit" class="btn btn-primary">
  #   =>   <i class="bi bi-save2"> </i>Atualizar Artigo
  #   => </button>
  #
  # Returns translated model pluralized.
  def translate_model_button(model, kind)
    t("form.button.#{kind}", model: tm(model))
  end
  alias_method :tmb, :translate_model_button

  ##
  # Public: Translate a model attribute.
  #
  # model: Model class.
  # attribute: Attribute name.
  # count: Count.
  #
  # Examples
  #
  #   <%= ta(Post, :title) %>
  #   # => "Titulo"
  #
  #   <%= ta(Post, :title, 2) %>
  #   # => "Títulos"
  #
  # Returns translated model's attribute.
  def translate_model_attribute(model, attribute, count = 1)
    model.human_attribute_name(attribute, count:)
  end
  alias_method :ta, :translate_model_attribute

  ##
  # Public: Translate a model enum.
  #
  # model: Model class.
  # count: Count.
  #
  # Examples:
  #
  #   <%= te(Post, :kind) %>
  #   # => "Artigo"
  #
  #   <%= te(Post, 2) %>
  #   # => "Artigos"
  #
  # Returns translated model's enum names.
  def translate_model_enum_names(model, enum, except: [])
    model.send(enum).keys.filter_map do |key|
      [model.human_attribute_name("#{enum}.#{key}"), key] if except.exclude?(key.to_sym)
    end
  end
  alias_method :teo, :translate_model_enum_names

  ##
  # Public: Translate a boolean attribute.
  #
  # value: TrueClass or FalseClass.
  #
  # Examples
  #
  #   <%= tb true %>
  #   # => "Sim"
  #
  #   <%= tb false %>
  #   # => "Não"
  #
  # Returns translated boolean's attribute.
  def translate_boolean(value)
    value ? t("true") : t("false")
  end
  alias_method :tb, :translate_boolean
end
