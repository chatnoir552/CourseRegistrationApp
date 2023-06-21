FactoryBot.define do
    factory :bookmark do
        day_of_week {'月曜日'}
        period {'1時限目'}
        credit { '2' }
        name { 'C言語' }
        school_year { '2' }
        user
        necessary { true }
        take { true }
    end
end