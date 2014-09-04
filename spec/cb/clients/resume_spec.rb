require 'spec_helper'

module Cb
  describe Cb::Clients::Resumes do
    context 'When a single resume is asked for with .get_resume_by_hash' do
      let(:content) { JSON.parse(File.read('spec/support/response_stubs/resume_get.json'))}
      let(:resume_hash) {'testHash'}
      let(:request) { Criteria::Resumes::GetByHash.new({resumeHash: resume_hash})}
      let(:resume_get_call) { Cb.resumes.get_resume_by_hash(request) }
      let(:model) { resume_get_call.model[0] }

      before :each do
        stub_request(:get, uri_stem(Cb.configuration.uri_resume_get.gsub(':resume_hash', resume_hash))).to_return(:body => content.to_json)
      end

      it { expect(resume_get_call).to be_a Responses::Resumes::Get }
      it { expect(model).to be_a Models::Resume }
      it { expect(model.user_identifier).to_not be_nil }
      it { expect(model.resume_hash).to_not be_nil }

      context 'and we look at the WorkExperience section' do
        it { expect(model.work_experience).to be_an Array }
        it { expect(model.work_experience[0]).to be_a Models::Resumes::WorkExperience }
      end

      context 'and we look at the SalaryInformation section' do
        it { expect(model.salary_information).to be_a Models::Resumes::SalaryInformation }
      end

      context 'and we look at the Education section' do
        it { expect(model.educations).to be_an Array }
        it { expect(model.educations[0]).to be_a Models::Resumes::Education }
      end

      context 'and we look at the SkillsAndQualifications section' do
        it { expect(model.skills_and_qualifications).to be_a Models::Resumes::SkillsAndQualifications }
        context 'and even deeper in the Languages section' do
          it { expect(model.skills_and_qualifications.languages_spoken).to be_an Array }
          it { expect(model.skills_and_qualifications.languages_spoken[0]).to be_a String }
        end
      end

      context 'and we look at the relocations section' do
        it { expect(model.relocations).to be_an Array }
        it { expect(model.relocations[0]).to be_a Models::Resumes::Relocation }
      end

      context 'and we look at the GovernmentAndMilitary section' do
        it { expect(model.government_and_military).to be_a Models::Resumes::GovernmentAndMilitary }
      end
    end
  end
end
