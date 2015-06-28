class User < ActiveRecord::Base
  include Clearance::User

  has_many :commutes, dependent: :destroy

  validates(
    :timezone,
    inclusion: { in: TZInfo::Timezone.all_identifiers },
    presence: true,
  )
end
