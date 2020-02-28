require 'rails_helper'

RSpec.describe Programminglog, type: :model do

  describe '#create' do

    context 'can save' do
      it 'is valid with text' do
        expect(build(:programminglog, image: nil)).to be_valid
      end

      it 'is valid with image' do
        programminglog = build(:programminglog, text: nil)
        programminglog.valid?
        expect(programminglog.errors[:text]).to include("を入力してください")
      end

      it 'is valid with text and image' do
        expect(build(:programminglog)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without content and image' do
        programminglog = build(:programminglog, text: nil, image: nil)
        programminglog.valid?
        expect(programminglog.errors[:text]).to include("を入力してください")
      end

      it 'is invalid without user_id' do
        expect(build(:programminglog, user_id: nil)).to be_valid
      end
    end

  end
  
end