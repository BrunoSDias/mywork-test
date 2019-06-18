module ApplicationHelper
  def flash_error
    if flash[:error]
      return "<div class='alert alert-danger alert-dismissible' role='alert'><strong>Error!</strong> #{flash[:error]}</div>".html_safe
    end
  end

  def flash_notice
    if notice
      return "<div class='alert alert-success alert-dismissible' role='alert'><strong>Success!</strong> #{notice}</div>".html_safe
    end
  end
end
