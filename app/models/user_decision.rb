class UserDecision < ApplicationRecord
  belongs_to :decision
  belongs_to :user
end
