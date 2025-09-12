class Components::Table::Root < Components::Base
  def initialize(records:, heads:, columns:, actions: [], prefix_path: nil, selectable: false)
    @records = records
    @heads = heads
    @columns = columns
    @actions = actions
    @prefix_path = prefix_path
    @selectable = selectable
  end

  def view_template
    Table do
      # TableCaption { "Companies" }

      Components::Table::Head(records: @records, heads: @heads, actions: @actions)

      TableBody do
        @records.each do |record|
          Components::Table::Row(record:, columns: @columns, actions: @actions, prefix_path: @prefix_path)
        end
      end

      # TableFooter do
      #   TableRow do
      #     TableHead(class: "font-medium", colspan: 3) { "Total" }
      #     TableHead(class: "font-medium text-right") { @companies.size }
      #   end
      # end
    end
  end
end
