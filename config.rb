set :encoding, 'utf-8'
set :relative_links, true

Time.zone = 'America/New_York'

activate :blog do |blog|
  blog.prefix = "blog"
  blog.permalink = "{year}/{month}/{day}/{title}"

  # Matcher for blog source files
  blog.sources = "{year}-{month}-{day}-{title}"
  blog.taglink = "tags/{tag}"
  blog.layout = "post"
  blog.summary_separator = /<!-- more -->/
  blog.summary_length = nil
  blog.year_link = "{year}.html"
  blog.month_link = "{year}/{month}.html"
  blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "blog/tag.html"
  blog.calendar_template = "blog/calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "page/{num}"
end

# Support for browsing from the build folder.
set :strip_index_file,  false

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do
  activate :sprockets

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Use relative URLs
  activate :relative_assets
end

activate :directory_indexes

$:.unshift File.expand_path(File.join(__FILE__, '..', 'lib'))
require 'chapter'

Chapter.all.each do |chapter|
  proxy chapter.path, "/chapter.html", locals: { chapter: chapter, title: chapter.name }, ignore: true
end

helpers do
  def chapters; Chapter.all; end
  def twitter_button(twitter)
    %(<a class="twitter-follow-button" href="https://twitter.com/#{twitter}" data-show-count="false" data-lang="en">Follow @#{twitter}</a>)
  end
  def paragraphs(string)
    string.strip.gsub(/\n+/, "<br>")
  end
  def summary_or_post(post)
    post.body == post.summary ? post.body : post.summary + "<a href=#{post.url} title=#{post.title}>Read More</a>"
  end

  def github_username; 'nscodernight'; end
  def twitter_username; 'nscodernight'; end

  def site_title; 'NSCoderNight'; end
  def site_baseurl; ''; end # the subpath of your site, e.g. /blog/
  def site_description; 'Socialize while you serialize'; end
  def contact_sentence; 'Please contact us at <a href="mailto:info@nscodernight.com">info@nscodernight.com</a> or <a href="http://twitter.com/nscodernight">@nscodernight</a> if you have questions.'; end
end
