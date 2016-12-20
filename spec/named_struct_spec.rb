# frozen_string_literal: true
require 'named_struct'
require 'pry'

RSpec.describe NamedStruct do
  before(:all) do
    Person = NamedStruct.new(:first, :last)
  end

  it 'accepts fields as named initializer params' do
    Person.new(first: 'Fred', last: 'Flintstone')
  end

  it 'requires all fields' do
    expect {
      Person.new(first: 'Madonna')
    }.to raise_error ArgumentError, 'missing keyword: last'
  end

  context 'invalid fields' do
    it 'rejects one invalid field' do
      expect {
        Person.new(first: 'Jean', last: 'Valjean', number: 24601)
      }.to raise_error(ArgumentError, 'unknown keyword: number')
    end

    it 'rejects multiple invalid fields' do
      expect {
        Person.new(first: 'Jean',
                   last: 'Valjean',
                   number: 24601,
                   demeanor: 'sad')
      }.to raise_error(ArgumentError, 'unknown keywords: number, demeanor')
    end
  end

  it 'provides readers' do
    instance = Person.new(first: 'Fred', last: 'Flintstone')
    expect(instance.first).to eq('Fred')
    expect(instance.last).to eq('Flintstone')
  end

  it 'provides writers' do
    instance = Person.new(first: 'Fred', last: 'Flintstone')
    instance.first = 'Wilma'
    expect(instance.first).to eq('Wilma')
  end
end
