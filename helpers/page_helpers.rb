module PageHelpers
  def link_to(text, href, **attrs)
    href = href.request_path if href.respond_to? :request_path
    content_tag(:a, attrs.merge(href: href)){ text }
  end

  def link_to_page(page)
    resource = case page
    when Sitemap::Resource
      page
    else
      site.resources.get(page)
    end

    link_to page.data.fetch("title", page.request_path), page.request_path
  end

  def link_to_if_current(text, page)
    if page == current_page
      link_to text, page, class: "active"
    else
      link_to text, page
    end
  end

  private
  def content_tag(entity, **attributes, &block)
    attributes = attributes.map{ |k,v| "#{k}='#{v}'" }.join(" ")
    "<#{[entity, attributes].join(" ")}>#{block.call if block_given?}</#{entity}>"
  end
end
