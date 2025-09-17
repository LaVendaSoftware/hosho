class Components::Table::Head < Components::Base
  include Phlex::Rails::Helpers::LinkTo

  def initialize(heads:, actions: [])
    @heads = heads
    @actions = actions
  end

  def view_template
    TableRow do
      TableHead {} if @actions.present?

      @heads.each do |head|
        TableHead { head }
      end
    end
  end
end
