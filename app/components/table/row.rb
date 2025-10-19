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
          @actions.each do |action|
            if action.in?([:link_to_edit, :link_to_show, :link_to_destroy])
              send(action, @record)
            else
              render(action.new(@record))
            end
          end
        end
      end

      @columns.each do |column|
        TableCell do
          if @record.send(column).is_a?(Array)
            @record.send(column).join(", ")
          else
            @record.send(column).presence || "—"
          end
        end
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
