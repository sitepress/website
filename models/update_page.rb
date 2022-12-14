class UpdatePage < Sitepress::Model
  collection glob: "project/updates/*.html.*"
  data :title, :subtitle

  def publish_at
    Chronic.parse(page.data.fetch("publish_at"))
  end
end