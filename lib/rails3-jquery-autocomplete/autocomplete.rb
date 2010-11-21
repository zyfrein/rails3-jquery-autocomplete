module Rails3JQueryAutocomplete

  # Inspired on DHH's autocomplete plugin
  # 
  # Usage:
  # 
  # class ProductsController < Admin::BaseController
  #   autocomplete :brand_and_products_search, { :brand => [:name, :description], :product => [:name, :description]  }
  # end
  #
  # This will magically generate an action autocomplete_brand_and_products_search, so, 
  # don't forget to add it on your routes file
  # 
  #   resources :products do
  #      get :autocomplete_brand_and_products_search, :on => :collection
  #   end
  #
  # Now, on your view, all you have to do is have a text field like:
  # 
  #   f.text_field :brand_or_products_name, :autocomplete => autocomplete_brand_and_products_search_products_path
  #
  #
  module ClassMethods
    def autocomplete(name, targets, options = {})

      define_method("autocomplete_#{name}") do
        
        term = params[:term]
          
        items = []
          
        if term && !term.empty?
          targets.each do |object, methods|
            methods.each do |method|
              items += ( get_items(:model => get_object( object ), \
              :options => options, :term => term, :method => method ) )
            end
          end
        else
          items = []
        end

        render :json => json_for_autocomplete(items.uniq, targets )
      end
    end
  end

end
