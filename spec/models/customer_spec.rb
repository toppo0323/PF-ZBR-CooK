require 'rails_helper'

RSpec.describe Customer, type: :model do
   subject { customer.valid? }

    let!(:other_customer) { create(:customer) }
    let(:customer) { build(:customer) }

  　context 'nameカラム' do
     it "空欄でないこと" do
      customer.name = ' '
      is_expected.to eq false
     end

     it '2文字以上であること: 1文字は×' do
        customer.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end

    end

end