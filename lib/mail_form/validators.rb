module MailForm
  module Validators
    class AbsenceValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors.add(attribute, :invlaid, options) unless value.blank?
      end
    end
  end
end