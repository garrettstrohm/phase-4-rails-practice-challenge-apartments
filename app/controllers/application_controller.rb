class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordInvalid, with: :rescue_from_record_invalid
rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found

    def rescue_from_record_invalid invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def rescue_from_record_not_found
        render json: {error: "Record not found"}, status: :not_found
    end
end
