class SignUps::NewPage < GuestLayout
  include Shared::AuthCard
  needs form : SignUpForm

  def content
    
    auth_card name: "Sign Up" do
      render_sign_up_form(@form)
    end
    
  end

  private def render_sign_up_form(f)
    form_for SignUps::Create do
      sign_up_fields(f)
      submit "Sign Up", flow_id: "sign-up-button"
    end
    br
    link "Sign in instead", to: SignIns::New
  end

  private def sign_up_fields(f)
  
    div class: "form-group" do
      field(f.email) { |i| email_input i, autofocus: "true", class: "form-control" }
    end
    
    div class: "form-group" do
      field(f.password) { |i| password_input i, class: "form-control" }
    end
    
    div class: "form-group" do
      field(f.password_confirmation) { |i| password_input i, class: "form-control" }
    end
  end
end
