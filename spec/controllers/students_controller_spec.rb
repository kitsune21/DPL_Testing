require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:valid_attr) do
    {name: 'Bob',
    gpa: 3,
    student_number: 7,
    school_id: 1}
  end
  let(:invalid_attr) do
    {name: '',
    gpa: 3,
    student_number: 7,
    school_id: 1}
  end
  # Write your test below
  # it will be easier to test this controller with factory bot
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #show" do
    it "returns http success" do
      student = Student.create! valid_attributes
      get :show, params: { id: student.id }
      expect(response).to be_successful
    end
  end
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to be_successful
    end
  end
  describe "GET #edit" do
    it "returns http success" do
      student = Student.create! valid_attributes
      get :edit, params: { id: student.id }
      expect(response).to be_successful
    end
  end
  describe "POST #create" do
    context "with valid params" do
      it "creates a new student" do
        expect {
          post :create, params: { student: valid_attributes }
        }.to change(Student, :count).by(1)
      end
      it "redirects to the created student" do
        post :create, params: { student: valid_attributes }
        expect(response).to redirect_to(Student.last)
      end
    end
    context "with invalid params" do
      it "does not creates a new student" do
        expect {
          post :create, params: { student: invalid_attributes }
        }.to change(Student, :count).by(0)
      end

      it "redirects to new template" do
        post :create, params: { student: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { gpa: 4 }
      }

      it "update the student" do
        student = Student.create! valid_attributes
        put :update, params: {id: student.id, school: new_attributes }
        student.reload
        expect(student.gpa).to eq(new_attributes[:gpa])
      end

      it "redirect to the student updated" do
        student = Student.create! valid_attributes
        put :update, params: {id: school.id, school: valid_attributes }
        expect(response).to redirect_to(student)
      end
    end

    context "with invalid params" do
      it "does not update the student" do
        student = Student.create! valid_attributes
        put :update, params: {id: student.id, student: invalid_attributes }
        student.reload
        expect(student.name).to_not eq(invalid_attributes[:name])
      end

      it "redirect to the edit form" do
        student = Student.create! valid_attributes
        put :update, params: {id: student.id, student: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested student" do
      student = Student.create! valid_attributes
      expect {
        delete :destroy, params: {id: student.id}
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the student list" do
      student = Student.create! valid_attributes
      delete :destroy, params: {id: student.id}
      expect(response).to redirect_to(students_url)
    end
  end
end


