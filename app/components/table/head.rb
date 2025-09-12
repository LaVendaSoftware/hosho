class Components::Table::Head < Components::Base
  def initialize(records:, heads:, actions:, selectable: false)
    @records = records
    @heads = heads
    @actions = actions
    @selectable = selectable
  end

  def view_template
    TableHeader do
      TableRow do
        TableHead { Checkbox() } if ToBoolean.call(@selectable)

        @heads.each do |head|
          TableHead { head }
        end

        TableHead { "Created at" } if @records.first.respond_to?(:created_at)
        TableHead { "" } if @actions.present?
      end
    end
  end
end
