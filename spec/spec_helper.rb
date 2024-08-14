# spec/spec_helper.rb
require 'rspec'
require 'fileutils'
# يمكنك تضمين أي مكتبات أو ملفات هنا إذا لزم الأمر
# require_relative '../lib/read' (مثال)

RSpec.configure do |config|
  # استخدم color في مخرجات RSpec
  config.color = true

  # استخدم تنسيق documentation للحصول على مخرجات أكثر تفصيلاً
  config.formatter = :documentation

  # إذا كنت تريد أن يتم تشغيل الاختبارات بترتيب عشوائي في كل مرة
  config.order = :random

  # إذا كنت تريد تسجيل بعض التعليمات البرمجية قبل أو بعد كل اختبار
  # config.before(:each) do
  #   # وضع أي تهيئة تحتاج إليها
  # end

  # إذا كنت ترغب في إيقاف تشغيل تسجيل البيانات الإضافية
  config.disable_monkey_patching!

  # يمكن إضافة إعدادات إضافية هنا
end
