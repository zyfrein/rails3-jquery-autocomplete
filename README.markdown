# This is a fork of elchbenny/rails3-jquery-autocomplete
Please find more information here https://github.com/elchbenny/rails3-jquery-autocomplete or about the main repository https://github.com/crowdint/rails3-jquery-autocomplete.

The main goal of that fork was to be able to have an autocomplete using few tables and few fields from database. That's doing the job by following the instructions.

## MongoID
I commented the parts of code which deal with mongoid. It's not supported.

## Usage

    class ProductsController < Admin::BaseController
      autocomplete :brand_and_products_search, { :brand => [:name, :description], :product => [:name, :description]  }
    end

    # This will magically generate an action autocomplete_brand_and_products_search, so, 
    # don't forget to add it on your routes file
     
    resources :products do
      get :autocomplete_brand_and_products_search, :on => :collection
    end
    
    # Now, on your view, all you have to do is have a text field like:
    
    f.text_field :brand_or_products_name, :autocomplete => autocomplete_brand_and_products_search_products_path

## Options
The options were not yet tested. I use the full search option that way:

    autocomplete :brand_and_products_search, { :brand => [:name, :description], :product => [:name, :description]  }, {:full => true}

and I modified the autocomplete.js to accept the submit_on_select option which submit the search when an item is selected in the list by key Enter or Tab, or clicked. That was taken from the fork => https://github.com/klacointe/rails3-jquery-autocomplete

I use it that way:

    <%= f.autocomplete_field :uid_contains, autocomplete_radio_item_main_search_radio_items_path, :submit_on_select => true %>

# Changelog

* 0.1.0 Ability to use few tables and few fields from database

# About the Author
Damien Bachet
Junior Ruby on Rails
Warsaw, Poland