class ToBoolean < ApplicationService
  def initialize(value)
    @value = value
  end

  def call = truthy?

  def truthy?
    @truthy ||= begin
      return false if @value.nil?
      return false if @value.blank?

      ActiveModel::Type::Boolean.new.cast(@value)
    end
  end

  def falsey? = !truthy?
end
