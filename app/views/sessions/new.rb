# frozen_string_literal: true

class Views::Sessions::New < Views::Base
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::Flash

  def initialize(email_address: nil, errors: {})
    @email_address = email_address
    @errors = errors
  end

  def view_template
    div(class: "mx-auto md:w-2/3 w-full") do
      Components::Page::Title(title: "Sign in")

      form_with(url: session_url, class: "contents") do |form|
        div(class: "my-5") do
          plain form.email_field :email_address,
            required: true,
            autofocus: true,
            autocomplete: "username",
            placeholder: "Enter your email address",
            value: @email_address,
            class:
              "block shadow-sm rounded-md border border-gray-400 focus:outline-blue-600 px-3 py-2 mt-2 w-full"
        end
        div(class: "my-5") do
          plain form.password_field :password,
            required: true,
            autocomplete: "current-password",
            placeholder: "Enter your password",
            maxlength: 72,
            class:
              "block shadow-sm rounded-md border border-gray-400 focus:outline-blue-600 px-3 py-2 mt-2 w-full"
        end
        div(class: "col-span-6 sm:flex sm:items-center sm:gap-4") do
          div(class: "inline") do
            plain form.submit "Sign in",
              class:
                "w-full sm:w-auto text-center rounded-md px-3.5 py-2.5 bg-blue-600 hover:bg-blue-500 text-white inline-block font-medium cursor-pointer"
          end
          div(class: "mt-4 text-sm text-gray-500 sm:mt-0") do
            link_to "Forgot password?",
              new_password_path,
              class: "text-gray-700 underline hover:no-underline"
          end
        end
      end
    end
  end
end
