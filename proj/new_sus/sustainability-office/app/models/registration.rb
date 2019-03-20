class Registration < ApplicationRecord
  belongs_to :person
  belongs_to :meeting

  def self.exists?(person, meeting)
    result = Registration.where("person_id = ? AND meeting_id = ?", person.id, meeting.id)
    return result.length > 0
  end
end
