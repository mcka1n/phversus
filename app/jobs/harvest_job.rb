class HarvestJob

  include SuckerPunch::Job

    def perform tag_param
      ActiveRecord::Base.connection_pool.with_connection do
        Media.ask_for_media_by_tag tag_param
      end
    end

end
