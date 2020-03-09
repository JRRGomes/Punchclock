module Api
  class ContributionsController < ApiController
    def create
      result = CreateContributionService.new.call(contributions_params)

      render json: result.json, status: result.status
    end

    private

    def contributions_params
      params.permit(:user, :link)
    end
  end
end
