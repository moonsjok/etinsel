class MyajaxsController < ApplicationController

  def ajax
     if params["param1"] =="states"
        @state_list = '<label>Etat / region</label><select class="form-control" onchange="getCities(this.value,\''+params["param0"]+'\')"><option value="Benin"> Etat / Région </option>'
            CS.states(params["param0"]).each do |state|
               @state_list= @state_list+ '<option value="'+state[0].to_s+'" >'+state[1].to_s+'</option>'
            end
        @state_list= @state_list+'</select>'
        render inline: "<%=raw(@state_list) %>"
     elsif params["param2"] =="cities"
       @state_list = '<label>Ville</label><select class="form-control" name="annonce[ville]" ><option value="Cotonou"> Ville </option>'
           CS.cities(params["param1"],params["param0"]).each do |state|
              @state_list= @state_list+ '<option value="'+state.to_s+'" >'+state.to_s+'</option>'
           end
       @state_list= @state_list+'</select>'
       render inline: "<%=raw(@state_list) %>"

    elsif params["param1"]=="setpays"
          session[:pays] = params[:param0]
          render inline: "<%=@Pays[session[:pays]].to_s %>"


    end

    end

end
