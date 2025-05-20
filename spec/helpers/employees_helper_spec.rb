require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EmployeesHelper. For example:
#
# describe EmployeesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EmployeesHelper, type: :helper do
  describe "#format_salary_group" do
    context "when salary is in first range" do
      it "returns badge with '1ª Faixa' and success style" do
        result = helper.format_salary_group(1000.00)
        expect(result).to match(/<span class="badge rounded-pill bg-success bg-gradient">1ª Faixa<\/span>/)
      end
    end

    context "when salary is in second range" do
      it "returns badge with '2ª Faixa' and light style" do
        result = helper.format_salary_group(2000.00)
        expect(result).to match(/<span class="badge rounded-pill bg-light bg-gradient text-dark">2ª Faixa<\/span>/)
      end
    end

    context "when salary is in third range" do
      it "returns badge with '3ª Faixa' and warning style" do
        result = helper.format_salary_group(3000.00)
        expect(result).to match(/<span class="badge rounded-pill bg-warning bg-gradient">3ª Faixa<\/span>/)
      end
    end

    context "when salary is in fourth range" do
      it "returns badge with '4ª Faixa' and danger style" do
        result = helper.format_salary_group(7000.00)
        expect(result).to match(/<span class="badge rounded-pill bg-danger bg-gradient">4ª Faixa<\/span>/)
      end
    end
  end
end
