require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'attributes' do
    let(:valid_attr) do
      {name: 'Bob',
      gpa: 3,
      student_number: 7,
      school_id: 1}
    end
    before(:each) do
      @student = Student.create(valid_attr)
    end
    it 'has a name' do
      expect(@student.name).to eq('Bob')
    end
    it 'has a gpa' do
      expect(@student.gpa).to eq(3)
    end
    it 'has a student number' do
      expect(@student.student_number).to eq(7)
    end
    it 'has a school' do
      name = 'Desert Hills'
      school = School.create({
        name: name,
        address: '123 Street BLVD',
        principal: 'Mr. T',
        capacity: 150,
        private_school: true
      })
      expect(@student.school_id).to eq(school.id)
    end
  end
end
