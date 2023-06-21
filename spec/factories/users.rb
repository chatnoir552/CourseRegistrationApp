FactoryBot.define do
    factory :user do
        grade { '1' }
        semester { '春セメスター' }
        name { 'テストユーザー' }
        password { 'password' }
        admin { false }
    end
end