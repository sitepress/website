class PrimaryPage < Sitepress::Model
  def title
    page.data.dig("primary_page", "title") || page.data.fetch("title")
  end

  def self.all
    # I need to refactor Sitepress::Model and Sitepress::Collection classes to make
    # this chainging work better. Ideally these could be mixed, like in ARel. This will
    # do for now until that day comes.
    site
      .glob("**/*.html.*")
      .select   { |page| page.data.has_key? "primary_page" }
      .sort_by  { |page| page.data.dig("primary_page", "order") || Float::INIFINTY }
      .map      { |page| new page }
  end
end
