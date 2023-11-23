module ApplicationHelper
  def current_user?(user)
    user && user == current_user
  end
  def bootstrap_alert(key)
    case key
    when "alert"
      "warning"
    when "notice"
      "success"
    when "error"
      "danger"
    end
  end
end
