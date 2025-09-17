class Components::Page::Show < Components::Base
  include Phlex::Rails::Helpers::DistanceOfTimeInWordsToNow
  include Phlex::Rails::Helpers::T
  include Phlex::Rails::Helpers::L

  def initialize(record:, columns:)
    @record = record
    @columns = columns
  end

  def view_template
    section(class: "antialiased") do
      div(class: "divide-y divide-gray-200 dark:divide-gray-700") do
        @columns.each do |column|
          Components::Page::ShowRow(
            value: @record.send(column),
            label: h.ta(@record.class, column.to_s.delete_prefix("humanized_").delete_prefix("formatted_"))
          )
        end

        [:created_at, :updated_at].each do |time_column|
          if @record.respond_to?(time_column)
            Components::Page::ShowRow(
              value: t("time.distances.past", time: distance_of_time_in_words_to_now(@record.send(time_column))),
              label: t("activerecord.attributes.#{time_column}"),
              title: l(@record.send(time_column), format: :custom)
            )
          end
        end
      end
    end
  end
end
