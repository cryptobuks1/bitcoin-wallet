module Shared::Layout
  macro included
    include Lucky::HTMLPage
    include Shared::FieldErrors
    include Shared::FlashMessages
    include Shared::Field
  end

  abstract def content

  def shared_layout_head
    head do
      utf8_charset
      title "My App - #{page_title}"
      add_bootstrap_cdn
      css_link asset("css/app.css")
      js_link asset("js/app.js")
      csrf_meta_tags
      responsive_meta_tag
    end
  end

  abstract def page_title

  # This is the default page title. If you remove method this the compiler will
  # help you remember to include a `page_title` method for every page because
  # we used `abstract def page_title` above. Alternatively, you can leave this
  # here and override the `page_title` class only on the pages you care about.
  def page_title
    "Welcome"
  end

  def add_bootstrap_cdn
  
    css_link "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
  
    script async: "async", 
      src: "https://code.jquery.com/jquery-3.3.1.slim.min.js", 
      integrity: "sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo", 
      crossorigin: "anonymous"
    
    script async: "async", 
      src: "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js", 
      integrity: "sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49", 
      crossorigin: "anonymous"

    script async: "async", 
      src: "https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js", 
      integrity: "sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy", 
      crossorigin: "anonymous"
  end 
end
