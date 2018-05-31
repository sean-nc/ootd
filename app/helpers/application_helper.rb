module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "OOTD"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def current_user?(user)
    user == current_user
  end
end