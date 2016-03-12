#require 'espolea'
require "spec_helper"
require "rails_helper"
describe 'GET #new' do
    it 'returns a blank instance' do
        review = Review.new
        expect(review.rating).to eq nil
        expect(review.body).to eq nil
    end
end
