class Worker < ApplicationRecord
  belongs_to :position
  validates :first_name, :last_name, :patronymic_name, :birthdate, presence: true
  validate :full_name_length_validate, :unique_full_name, :valid_date   #Custom validates

  def full_name
    "#{first_name} #{last_name} #{patronymic_name}"
  end

private
  def full_name_length_validate  #lenght validates  12<full_name<255
    if full_name.length > 255
      errors.add(:exceeding_number_symbols, "The number of symbols must not exceed 255")
    end
    if full_name.length < 12
      errors.add(:belittlement_number_symbols, "The number of symbols must not be less than 10")
    end
  end

  def unique_full_name          #validate unique full_name string
    if (Worker.where(first_name: first_name, last_name: last_name, patronymic_name: patronymic_name).size > 0)
      errors.add :full_name, 'has already been taken'
    end
  end

  def valid_date                #Дата рождения, необязательное, не должно превышать текущую дату.
    if birthdate > Time.now
      errors.add :birthdate, 'Not yet was born, and already work?'
    end
  end
end
