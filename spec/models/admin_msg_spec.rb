require 'rails_helper'

RSpec.describe AdminMsg, type: :model do
  it 'checks performance of the model' do
    input = "new msg"
    res = AdminMsg.find_by(body: "new msg")
    res&.destroy
    local_res = AdminMsg.create body: input
    local_res.save
    result = AdminMsg.find_by(body: "new msg").body
    expect(result).to eq(input)
  end
  
  it 'checks performance of the model' do
    input = "new msg"
    res = AdminMsg.find_by(body: "new msg")
    res&.destroy
    local_res = AdminMsg.create! body: input

    expect do
      local_res = AdminMsg.create! body: input
    end.to raise_error
  end
  
  it 'check valid' do
    msg = AdminMsg.new(body: nil)
    expect(msg).to_not be_valid
  end

  it 'check valid' do
    msg = AdminMsg.new(body: "qwe")
    expect(msg).to_not be_valid
  end

end
