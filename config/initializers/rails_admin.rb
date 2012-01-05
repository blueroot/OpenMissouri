module RailsAdmin
  
  class AbstractHistory
      # disable rails_admin's history tracking
      def self.create_history_item(message, object, abstract_model, user) ; end

      # Fetch the history items for a model.  Returns an array containing
      # the page count and an AR query result containing the history
      # items.
      def self.history_for_model(model, query, sort, sort_reverse, all, page = 1, per_page = RailsAdmin::Config::Sections::List.default_items_per_page || 20)
        []
      end

      def self.history_for_object(model, object, query, sort, sort_reverse)
        []
      end

      # Fetch the history item counts for one month.
      def self.history_for_month(month, year)
        []
      end

      # Fetch the history item counts between the dates provided.
      def self.history_summaries(from, to)
        []
      end

      # Fetch the most recent history item for a model.
      def self.most_recent_history(name)
        nil
      end

    end
  
  
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