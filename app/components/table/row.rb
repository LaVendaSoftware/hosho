class Components::Table::Row < Components::Base
  include Phlex::Rails::Helpers::DOMID
  include Phlex::Rails::Helpers::L

  DEFAULT_ACTIONS = [:link_to_edit, :link_to_show, :link_to_destroy]

  def initialize(record:, columns:, actions:, prefix_path: nil, selectable: false)
    @record = record
    @columns = columns
    @actions = actions
    @prefix_path = prefix_path
    @selectable = selectable
  end

  def view_template
    TableRow do
      @columns.each do |column|
        TableCell { @record.send(column).presence || "—" }
      end

      TableCell { l(@record.updated_at, format: :short) } if @record.respond_to?(:updated_at)

      TableCell(class: "text-right") do
        if @actions.present?
          @actions.each do |action|
            if @record.respond_to?(action)
              @record.send(action)
            elsif DEFAULT_ACTIONS.include?(action)
              send(action)
            end
          end
        end
        # Components::LinkTo::Destroy(company_path(company))
      end
    end
  end

  private

  def link_to_edit
    Components::LinkTo::Edit(@record, prefix_path: @prefix_path)
  end

  def link_to_show
    plain "V "
  end

  def link_to_destroy
    plain "D "
  end
end
