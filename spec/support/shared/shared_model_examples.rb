

shared_examples :is_unique do |model, param, type|

    singular = model.to_s.underscore.to_sym

  it  "is expected " + param.to_s + " to be unique" do

    record1 = create singular, param.to_sym => TYPES[type.to_sym]
    record2 = build singular, param.to_sym => TYPES[type.to_sym]
    value = TYPES[type.to_sym]

    expected record2 not_to be_valid
  end
end
