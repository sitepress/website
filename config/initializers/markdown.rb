# Restart the server to see changes made to this file.

# MarkdownRails.configure do
#   ApplicationMarkdown.new.register :md, :markdown
# end

# Setup markdown stacks to work with different template handler in Rails.
MarkdownRails.handle :md, :markdown, with: :ApplicationMarkdown

# Don't use Erb for untrusted markdown content created by users; otherwise they
# can execute arbitrary code on your server. This should only be used for input you
# trust, like content files from your code repo.
MarkdownRails.handle :markerb, with: :ApplicationMarkdown