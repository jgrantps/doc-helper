module AccountHelper
  
  def company_select(account)
    case current_user.role
    when "admin"
      account.label :company_id, "Associated Company" 
      account.collection_select :company_id, Company.all, :id, :name, prompt: true
          
    when "manager"
      account.label :company_id, "Associated Company" 
      account.collection_select :company_id, Company.all, :id, :name, prompt: true
    when "contact"
    end
  end
end
