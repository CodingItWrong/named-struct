# frozen_string_literal: true
require 'named_struct'
require 'pry'

RSpec.describe NamedStruct do
  before do
    Person = NamedStruct.new(:first, :last)
  end

  it 'accepts fields as named initializer params' do
    Person.new(first: 'Fred', last: 'Flintstone')
  end

  it 'sets omitted fields to nil' do
    instance = Person.new(first: 'Madonna')
    expect(instance.first).to eq('Madonna')
    expect(instance.last).to be_nil
  end

  context 'invalid fields' do
    it 'rejects one invalid field' do
      expect {
        Person.new(number: 24601)
      }.to raise_error(ArgumentError, 'unknown keyword: number')
    end

    it 'rejects multiple invalid fields' do
      expect {
        Person.new(number: 24601, demeanor: 'sad')
      }.to raise_error(ArgumentError, 'unknown keywords: number, demeanor')
    end
  end

  it 'provides readers' do
    instance = Person.new(first: 'Fred')
    expect(instance.first).to eq('Fred')
  end

  it 'provides writers' do
    instance = Person.new(first: 'Fred', last: 'Flintstone')
    instance.first = 'Wilma'
    expect(instance.first).to eq('Wilma')
  end
end
