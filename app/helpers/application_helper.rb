# appliation helper
module ApplicationHelper
  def css_class_for(flash_type)
    { success: 'alert-success', error: 'alert-danger', alert: 'alert-danger',
      notice: 'alert-success', warning: 'alert-warning',
      danger: 'alert-danger' }[flash_type.to_sym] || flash_type.to_s
  end
end
