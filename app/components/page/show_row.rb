class Components::Page::ShowRow < Components::Base
  def initialize(value:, label:, title: nil)
    @value = value
    @label = label
    @title = title.presence || value
  end

  def view_template
    div(
      title: @title,
      class: "flex gap-2 p-4 sm:gap-6 sm:flex-row sm:items-center"
    ) do
      p(
        class:
          "w-32 text-lg font-normal text-gray-500 sm:text-right dark:text-gray-400 shrink-0"
      ) { @label }
      h3(class: "text-lg font-semibold text-gray-900 dark:text-white") do
        if @value.is_a?(Array)
          @value.join(", ")
        else
          @value.presence || "—"
        end
      end
    end
  end
end
