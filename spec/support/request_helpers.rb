require 'spec_helper'

def json
  @json ||= JSON.parse(response.body)
end

def check_json(object, json)
  serialized = object.as_json
  serialized.map do |attr, value|
    if (attr == "logo")
      expect(json["logo"]["url"]).to eq value["url"]
      expect(json["logo"]["thumb"]["url"]). to eq value[:thumb]["url"]
    elsif (attr == "created_at") or (attr == "updated_at")
    else
      expect(json[attr]).to eq value
    end
  end
end