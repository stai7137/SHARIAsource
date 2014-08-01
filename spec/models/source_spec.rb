# == Schema Information
#
# Table name: sources
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  region_id        :integer
#  document_type_id :integer
#  pdf              :string(255)
#  processed        :boolean          default(TRUE)
#

describe Source do
  it { should validate_presence_of :title }
  it { should respond_to :pdf }
  it { should have_and_belong_to_many :themes }
  it { should have_and_belong_to_many :topics }
  it { should have_and_belong_to_many :tags }
  it { should have_and_belong_to_many :eras }
  it { should have_many(:pages).dependent :destroy }
  it { should belong_to :region }
  it { should belong_to :document_type }
  it { should accept_nested_attributes_for :pages }
end