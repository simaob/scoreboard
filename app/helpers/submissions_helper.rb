module SubmissionsHelper
  def pr_status state
    color, icon = if state == "open"
              ["info", "clock"]
            elsif state == "merged"
              ["success", "check"]
            else
              ["danger", "x-circle"]
            end
    content_tag(:span, title: state, class: "text-#{color}") do
      content_tag(:span, nil, data: { feather: icon })
    end
  end
end
