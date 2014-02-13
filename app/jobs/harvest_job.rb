class HarvestJob
  include SuckerPunch::Job

    def perform tag_param
      p 'DEBUG == on HarvestJob'
      ActiveRecord::Base.connection_pool.with_connection do
        Media.ask_for_media_by_tag tag_param
      end
    end
end
