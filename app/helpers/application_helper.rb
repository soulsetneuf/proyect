module ApplicationHelper
  def bootstrap_class_for flash_type
    case flash_type
      when 'success'
        "alert-info"
      when 'error'
        "alert-warning"
      when 'alert'
        "alert-danger"
      when 'notice'
        "alert-success"
      else
        flash_type.to_s
    end
  end
end
