module SubmissionsHelper
  def pr_status state
    color = if state == "open"
              "info"
            elsif state == "merged"
              "success"
            else
              "danger"
            end
    content_tag("span", state, class: "text-#{color}")
  end
end
