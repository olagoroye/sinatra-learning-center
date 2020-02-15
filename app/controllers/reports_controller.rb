class ReportsController < ApplicationController
#   view all report=> index.erb
    get '/reports' do
       @reports = Report.all
       erb :'/reports/index'
    end


    # create new report
    get '/reports/new' do 

       erb :"/reports/new"
     
    end



# post request for post
    post '/reports' do 
       
    #    if user not log in --- take back to the welcome page
        if !logged_in?
            redirect '/'
        end
         # this restfulroute will generate new report if there is comment associated to subjects
        if params[:report][:date] != "" && params[:report][:user_id] != "" && params[:report][:subjects] != "" &&
             params[:report][:comment] != "" &&  params[:report][:due_date] != ""
            #  binding.pry
            @report =Report.create(params[:report])
            # (date: params[:date], 
            #  comment: params[:comment], user_id: params[:user_id],
            # due_date: params[:due_date], subjects: params[:subjects],)
            redirect "/reports/#{@report.id}"
        else
            redirect '/reports/new'
        end
    end 
# Show route for Report(dynamic route=> )
    get '/reports/:id' do 
       set_report
       erb :'/reports/show'
    end

    #Edit route=> to render an edit form

    get '/reports/:id/edit' do
        # binding.pry
        set_report 
        if logged_in?
            if @report.user == current_user
            erb :'/reports/edit'
            else 
            redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/reports/:id' do
        set_report
        if logged_in?
            if @report.user == current_user
                @report.update(params[:report])
                redirect "/reports/#{@report.id}"
            else
            redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end 

    delete '/reports/:id' do
        set_report
        if logged_in?
            if @report.user == current_user
                @report.destroy
                redirect '/reports'
            else
            redirect '/reports'
            end
        else
            redirect '/'
        end
       
    end

    private

    def set_report
        @report = Report.find_by(id: params[:id])

    end


end