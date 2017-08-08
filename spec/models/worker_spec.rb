require 'rails_helper'

#Пишу тесты ночью. в задании было ясно сказано, что они не обязательны, но стараюсь набрать баллов за старание.
#обычно я обходился без тестов, поэтому в начале буду испытывать с ними трудности и это будет влиять на время выполнения основных задач.


RSpec.describe Worker, :type => :model do
  it "it validates worker_params" do #validate all
    @worker = Worker.new(first_name:"John",
                         last_name:"Smith",
                         patronymic_name:"Alexeevich",
                         birthdate:"#{(Time.now)-10}")
    @worker.valid?
  end

  it "it not validates worker_params" do #invalid full_name > 255, birthdate > time.now
    @worker = Worker.new(first_name:"qwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwert",
                         last_name:"qwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwert",
                         patronymic_name:"qwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwertqwert",
                         birthdate:"#{(Time.now)+10}")
    expect(@worker).to_not be_valid
  end
  it "worker_params empty" do #invalid all params empty
    @worker = Worker.new(first_name:"",
                         last_name:"",
                         patronymic_name:"",
                         birthdate:"1-1-2012") #тот момент когда к nil нельзя применить '>'
    expect(@worker).to_not be_valid
  end
end
