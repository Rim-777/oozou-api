require 'rails_helper'

RSpec.describe Content, type: :model do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:content)}
  it {should validate_presence_of(:status)}
  it {should belong_to(:author)}
end
