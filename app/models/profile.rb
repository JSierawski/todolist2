class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_or_last_name_not_null, :gender_is_male_or_female, :no_boy_named_sue

  def first_or_last_name_not_null
    if !first_name.present? && !last_name.present?
      errors.add(:first_name, "First and last name cannot be null!")
    end
  end

  def gender_is_male_or_female
    if gender != "male" && gender != "female"
      errors.add(:gender, "Gender must be either male or female!")
    end
  end

  def no_boy_named_sue
    if gender == "male" && first_name == "Sue"
      errors.add(:first_name, "Life ain't easy for a boy named Sue!")
    end
  end
end
