module ApplicationHelper
  def display_team(team)
    if team
      link_to(team.name, team)
    else
      content_tag("i", "None")
    end
  end
end
