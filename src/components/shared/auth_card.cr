module Shared::AuthCard
  def auth_card(name : String)
  
  
    div class: "container" do
      div class: "row justify-content-center mt-5" do
        # xs (phones), sm (tablets), md (desktops), and lg (larger desktops)
        div class: "col-12 col-sm-10 col-md-8 col-lg-6" do
          div class: "card" do
            div class: "card-header" do
              text name
            end
            div class: "card-body" do
              yield
            end
          end
        end
      end
    end
    
  end
end