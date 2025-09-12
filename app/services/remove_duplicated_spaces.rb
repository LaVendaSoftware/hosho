class RemoveDuplicatedSpaces < ApplicationService
  def initialize(string)
    @string = string
  end

  def call = @string.to_s.gsub(/[^\S\n]+/, " ").strip
end
