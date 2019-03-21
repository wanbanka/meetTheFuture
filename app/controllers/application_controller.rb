class ApplicationController < ActionController::Base
    
    before_action :set_locale
    
    before_action :configure_permitted_parameters, if: :devise_controller?

rescue_from CanCan::AccessDenied do |exception|
   flash[:error] = exception.message
    redirect_back fallback_location: root_url
end

def custom_paginate_renderer
  # Return nice pagination for materialize
  Class.new(WillPaginate::ActionView::LinkRenderer) do
  def container_attributes
    {class: "container"}
  end

  def page_number(page)
    if page == current_page
      tag(:span, page, class: 'btn btn-primary')
    else
      link(page, page, class: 'btn', rel: rel_value(page))
    end
  end

  def gap
    text = @template.will_paginate_translate(:page_gap) { '&hellip;' }
    %(<span class="label">#{text}</span>)
  end

  def previous_page
    num = @collection.current_page > 1 && @collection.current_page - 1
    previous_or_next_page(num, @options[:previous_label], 'btn')
  end

  def next_page
    num = @collection.current_page < total_pages && @collection.current_page + 1
    previous_or_next_page(num, @options[:next_label], 'btn')
  end

  def previous_or_next_page(page, text, classname)
    if page
      link(text, page, :class => classname)
    else
      tag(:span, text, :class => classname + ' btn')
    end
  end
  end
end


protected

def configure_permitted_parameters
   added_attrs = [:nom, :prenom, :pseudo, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
end

private

def set_locale
   I18n.locale = :fr 
end
    
end
