module AnswersHelper
    def get_recommendations()
        studies = Answer.all.where.not(id: Answer.id)
        recommendations = Array.new

        studies.each do |study|
            intersection = self.topics & study.topics
            ratio = intersection.size.to_f / study.topics.size
            if ratio > 0.5
                recommendations.push(study.id)
            end
        end
        return recommendations
    end
end