module AnswersHelper

    def write_metadata(params, questionnaire)
        metadata = {
            "id" => params[:id],
            "study" => params[:study],
            "title" => params[:title],
            "data" => questionnaire,
            "topics" => params[:topics],
            "pid" => params[:pid],
            "country" => params[:country],
            "institutions" => params[:institutions],
            "authors" => params[:authors],
            "ethics" => params[:ethics],
            "description" => params[:description],
            "status" => params[:status],
            "timestamp" => Time.now.getutc
          } 
        File.open("public/#{metadata["id"]}_#{Time.now.to_i}.json","w") do |x|
          x.write(metadata.to_json)
        end 
      end

end