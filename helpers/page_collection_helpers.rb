module PageCollectionHelpers
  def order_pages(pages)
    pages.sort_by { |r| r.data.fetch("order", Float::INFINITY) }
  end

  def order_glob(glob)
    order_pages site.resources.glob(glob).select{ |r| r.data.has_key? "title" }
  end
end
