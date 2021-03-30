# frozen_string_literal: true

require_relative '../credit_card'
require 'minitest/autorun'

# Feel free to replace the contents of cards with data from your own yaml file
card_details = [
  { num: '4916603231464963',
    exp: 'Mar-30-2020',
    name: 'Soumya Ray',
    net: 'Visa' },
  { num: '6011580789725897',
    exp: 'Sep-30-2020',
    name: 'Nick Danks',
    net: 'Visa' },
  { num: '5423661657234057',
    exp: 'Feb-30-2020',
    name: 'Lee Chen',
    net: 'Mastercard' }
]

cards = card_details.map do |c|
  CreditCard.new(c[:num], c[:exp], c[:name], c[:net])
end

describe 'Test hashing requirements' do
  describe 'Test regular hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
      it 'should check that each card produces the same hash' do
        cards.map do |cc|
          hashed = cc.hash
          _(hashed).wont_be_nil
          _(hashed).must_equal cc.hash
        end
      end
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      it 'should check that each different card produces a different hash' do
        hash_len = cards.map(&:hash).uniq.length
        _(cards.uniq.length).must_equal hash_len
      end
    end
  end

  describe 'Test cryptographic hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
      it 'should check that each card produces the same hash' do
        cards.map do |cc|
          hashed = cc.hash_secure
          _(hashed).wont_be_nil
          _(hashed).must_equal cc.hash_secure
        end
      end
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      it 'should check that each different card produces a different hash' do
        hash_len = cards.map(&:hash_secure).uniq.length
        _(cards.uniq.length).must_equal hash_len
      end
    end

    describe 'Check regular hash not same as cryptographic hash' do
      # TODO: Check that each card's hash is different from its hash_secure
      it 'should check that each card_hash is different from its hash_secure' do
        cards.map do |cc|
          norm_hashed = cc.hash
          _(norm_hashed).wont_equal cc.hash_secure
        end
      end
    end
  end
end
