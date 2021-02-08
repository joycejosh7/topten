class ListsController < ApplicationController
    def index
        if params[:topic_id] && @topic = Topic.find_by_id(params[:topic_id])
          @lists = List.where("topic_id = '#{@topic.id}'")
        else
          @error = "that topic does not exist" if params[:topic_id]
          @lists = List.all.reverse
        end
      end
end
