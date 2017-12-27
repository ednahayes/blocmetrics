 class API::EventsController < ApplicationController
    #added per CSRF doc: commented out in order to test the API using curl
    #skip_before_action :verify_authenticity_token

    before_filter :set_access_control_headers
    
    # added below per CSRF doc: necessary in all controllers that will respond with JSON
    respond_to :json
    
    
    def set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
     headers['Access-Control-Allow-Headers'] = 'Content-Type'
     headers['Access-Control-Request-Method'] = '*'
    end


    def create
     registeredapp = Registeredapp.find_by(url: request.env['HTTP_ORIGIN'])
     
     if registeredapp
        event = Registeredapp.events.new(event_params)
        if event.save
            render json: @event, status: :created
        else
            render json: {errors: @event.errors}, status: :unprocessable_entity
        end  
     else
        error('validation', 'unregistered application') 
     end
    end
   
   
    def preflight
        head 200
    end
    
    
    private
    def event_params
     params.require(:event).permit(:name)
    end  
    
    #added below per CSRF doc:
    # Error responses and before_action blocking work differently with Javascript requests.
    # Rather than using before_actions to authenticate actions, we suggest using
    # "guard clauses" like `permission_denied_error unless condition`
    def permission_denied_error
        error(403, 'Permission Denied!')
    end

    def error(status, message = 'Something went wrong')
        response = {
         response_type: "ERROR",
         message: message
        }

        render json: response.to_json, status: status
    end  
 end