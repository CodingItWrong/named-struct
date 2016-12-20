# frozen_string_literal: true
module NamedStruct
  def self.new(*fields)
    Class.new do
      fields.each do |field|
        attr_accessor field
      end

      binding.eval <<~EOT
        def initialize(#{fields.map { |f| "#{f}:" }.join(', ')}) # def initialize(first:, last:)
          #{fields.map { |f| "@#{f} = #{f}" }.join("\n")}        #   @first = first
        end
      EOT
    end
  end
end
