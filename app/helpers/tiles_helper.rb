module TilesHelper
#logic to control contents inside of the columns tiles IF called by the CANVAS method.
  def tiles(tiling_elements:, sorting_condition:)
    case @src_controller 
    when "companies"
      account = @company.accounts.find_by(name: sorting_condition)
      filtered_tile_collection = tiling_elements.specific(account)

    when "users" || "associates"
      filtered_tile_collection = tiling_elements.where(:status => sorting_condition)
      
    end

    render partial: "dashboard_elements/canvas_elements/column_tiles", :collection => filtered_tile_collection, as: :element, 
    locals: {:indexes => "indexes", :account => "account", :status => "status",:name => "name", :company => "company", :users => "users"}
  end
end
