module PageHelper
  def link_to_page(page, text=nil, *args, key: "title", **kwargs)
    text ||= page.data.fetch(key, page.request_path)
    link_to text, page.request_path, *args, **kwargs
  end

  def link_to_if_current(text, page, *args, active_class: "active", **kwargs)
    if page == current_page
      link_to text, page.request_path, *args, class: active_class, **kwargs
    else
      link_to text, page.request_path, *args, **kwargs
    end
  end
end
