class Components::Footer::Footer < Components::Base
  def view_template
    footer(class: "border-t bg-card text-center text-sm text-muted-foreground p-4") do
      plain " © "
      plain Time.current.year
      plain " Hosho payments "
    end
  end
end
