class SignIns::NewPage < GuestLayout

  include Shared::AuthCard
  needs form : SignInForm

  def content
    
    auth_card name: "Sign In" do
      render_sign_in_form(@form) 
    end
    
  end

  private def render_sign_in_form(f) : IO::Memory
    form_for SignIns::Create do
      sign_in_fields(f)
      submit "Sign In", flow_id: "sign-in-button", class: "btn btn-primary mb-3"
    end
    link "Reset password", to: PasswordResetRequests::New
    text " | "
    link "Sign up", to: SignUps::New
  end

  private def sign_in_fields(f)
  
    div class: "form-group" do
      field(f.email) { |i| email_input i, autofocus: "true", class: "form-control" }
    end
    div class: "form-group" do
      field(f.password) { |i| password_input i, class: "form-control" }
    end
  end
end
