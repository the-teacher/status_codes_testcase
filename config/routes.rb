Rails.application.routes.draw do
  root 'welcome#index'

  (STATUS_CODES_4XX + STATUS_CODES_5XX).each do |code|
    match "give-me-code-#{code}" => "welcome#give_me_code_#{code}", via: %w[get post]
  end

  3.times do |i|
    match "give-me-bug-#{ i.next }" => "welcome#give_me_bug_#{ i.next }", via: %w[get post]
  end
end
