class Components::Table::Row < Components::Base
  include Phlex::Rails::Helpers::LinkTo

  def initialize(record:, columns:, actions: [])
    @record = record
    @columns = columns
    @actions = actions
  end

  def view_template
    TableRow do
      if @actions.present?
        TableCell(class: "flex gap-2") do
          @actions.each { |action| send(action, @record) }
        end
      end

      @columns.each do |column|
        TableCell { @record.send(column) }
      end
    end
  end

  private

  def link_to_edit(record)
    Components::LinkTo::Edit(record)
  end

  def link_to_show(record)
    Components::LinkTo::Show(record)
  end

  def link_to_destroy(record)
    Components::LinkTo::Destroy(record)
  end
end
