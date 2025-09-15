class Components::Table::List < Components::Base
  include Phlex::Rails::Helpers::LinkTo

  def initialize(records:, heads:, columns:, actions: [])
    @records = records
    @heads = heads
    @columns = columns
    @actions = actions
  end

  def view_template
    Table do
      TableHeader do
        Components::Table::Head(heads: @heads, actions: @actions)
      end

      TableBody do
        @records.each do |record|
          Components::Table::Row(record:, columns: @columns, actions: @actions)
        end
      end
    end
  end
end
