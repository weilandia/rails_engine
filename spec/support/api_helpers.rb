module ApiHelpers
  def json_body
    body = JSON.parse(response.body)
    if body.class == Array
      body.map { |record| record.dup.except("created_at", "updated_at") }
    else
      body.dup.except("created_at", "updated_at")
    end
  end
end

RSpec.configure do |config|
  config.include ApiHelpers, type: :request
end
