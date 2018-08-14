abstract class MainLayout
  # Edit shared layout code in src/components/shared/layout.cr
  include Shared::Layout

  # 'needs current_user : User' makes it so that the current_user
  # is always required for pages using MainLayout
  needs current_user : User

  def render
    html_doctype

    html lang: "en" do
      shared_layout_head
      body class: "main-application" do
        div class: "wrapper" do
          render_sidebar
          div class: "content" do
            render_top_navbar
            render_flash
            content
          end
        end
      end
    end
  end
  
  def app_title
    "Lucky Wallet"
  end
  
  abstract def select_sidebar
  
  private def render_top_navbar
    nav class: "navbar top-navbar" do
      ul class: "navbar-nav ml-auto" do
        li class: "nav-item" do
          link "Sign out", to: SignIns::Delete, flow_id: "sign-out-button",
            class: "nav-link"
            
        end
      end
    end  
  end

  private def render_sidebar
    nav id: "sidebar" do
      div class: "sidebar-header text-center" do
        h5 app_title
      end  
      ul class: "list-unstyled components" do
        para class: "text-center sub-header" do
          text @current_user.email
        end
        li class: "mt-3 mb-1 d-none d-md-block" do
          div class: "span menu-title" do
            raw "Menu"
          end
        end
        
        # The items
        sidebar_item(:me, "Me", Me::Show)
        
      end
    end
  end
  
  private def sidebar_item(type, name, link)
    cl = select_sidebar == type ? "active" : "normal"
    li class: cl do
      a href: link.path do
        i class: "align-middle"
        span class: "hidden-xs align-middle" do
          raw name
        end
      end
    end
  end
end
