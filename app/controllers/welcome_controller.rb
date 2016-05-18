class WelcomeController < ApplicationController
  def index; end

  (STATUS_CODES_5XX + STATUS_CODES_4XX ).each do |status_code|
    define_method("give_me_code_#{ status_code }") do
      @status_code = status_code

      respond_to do |format|
        format.html { render 'welcome/response_page', status: status_code }
        format.json { json_responder(status_code) }
        format.js   { json_responder(status_code) }
        format.any  { render nothing: true, status: status_code }
      end
    end
  end

  def give_me_bug_1
    0/0
  end

  def give_me_bug_2
    undefined_variable
  end

  def give_me_bug_3
    raise 'AN EXCEPTION'
  end

  private

  def json_responder(status_code)
    data = { text: "Current status code is `#{ status_code }`" }
    render json: data, status: status_code
  end
end
