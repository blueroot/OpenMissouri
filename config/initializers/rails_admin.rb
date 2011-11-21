module RailsAdmin
  
  RailsAdmin.config do |config|
    #config.main_app_name = ["OpenMissouri"]
    config.excluded_models << "UserIdentity"
  
#  config.model UserIdentity do
#      visible false
#  end
#  
#  
#  config.model Category do
#    list do
#      sort_by :name
#      sort_reverse false 
#    end
#  end
#
  config.model DataSet do
    list do
      sort_by :name
      sort_reverse false 
      
      field :id
      field :name
      field :suggester_id do
        formatted_value do # used in form views
          if value
            User.exists?(value) ? User.find(value).full_name : "user doesn't exist"
            
          else
            "admin"
          end
        end
      
      end
      field :created_at
      
      
      #field :samplefile_file_name do
      #  formatted_value do
      #    bindings[:view].tag(:link, { :href => bindings[:object].samplefile.url }) << value
      #  end
      #end
      
    end
    
    show do
      
      exclude_fields :interest
    end
    edit do
      
      group :comments do
        hide
      end

    end
  end
  
  config.model SunshineRequest do
    list do
      field :id
      field :data_set
      field :first_name
      field :last_name 
      field :agency_name
      field :entity_name
      field :created_at
      
      
    end
  end
#
#  config.model Organization do
#    list do
#      sort_by :name
#      sort_reverse false 
#    end
#  end
#
#  config.model GovernmentLevel do
#    list do
#      sort_by :name
#      sort_reverse false 
#    end
#  end
#
#  config.model User do
#    list do
#      sort_by :full_name
#      sort_reverse false 
#    end
#  end
#  
#  config.model Page do
#    
#    list do
#      sort_by :sort
#      sort_reverse false 
#      
#      field :title
#      field :section
#      field :sort
#      field :published
#    end
#    
#    #this is arbitrary
#    
#    edit do
#      
#       
#    end
  end
  
end