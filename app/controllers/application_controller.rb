class ApplicationController < ActionController::Base
    #MODIFICATION FAITES POUR DEVISE
    #(Autorisé la connexion avec soit l'email, soite l'username ou soite le phonenumber)
    before_action :configure_devise_parameters , if: :devise_controller?
    before_action :set_my_global_var
    def configure_devise_parameters
		if !params[:user].nil?
			## JUSTE POUR AJOUTER L'INDICATIF AU NUMERO DE TELEPHONE SAISI LORS DE L'INSCRIPTION
			params[:user][:phonenumber] = params[:user][:indicatif].to_s+params[:user][:phonenumber].to_s.gsub(' ','')
		end
		if !params[:administrateur].nil?
			## JUSTE POUR AJOUTER L'INDICATIF AU NUMERO DE TELEPHONE SAISI LORS DE L'INSCRIPTION
			params[:administrateur][:phonenumber] = params[:administrateur][:indicatif].to_s+params[:administrateur][:phonenumber].to_s.gsub(' ','')
		end

		devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:email,:username,:phonenumber,:password,:password_confirmation)}
    end


    def set_my_global_var
          @user=current_user

  			if params[:sous_categorie].nil?
  			       session[:sous_categorie]=""
  			else
  			   session[:sous_categorie]=params[:sous_categorie]
  			end

              ############################################### TABLEAU DES PAYS ###########################################
        @Pays = {"TG"=>"Togo","BJ"=>"Benin","US"=>"USA","DZ"=>"Algeria","AD"=>"Andorra","AO"=>"Angola","AI"=>"Anguilla","AG"=>"Antigua &amp; Barbuda","AR"=>"Argentina","AM"=>"Armenia","AW"=>"Aruba","AU"=>"Australia","AT"=>"Austria","AZ"=>"Azerbaijan","BS"=>"Bahamas","BH"=>"Bahrain","BD"=>"Bangladesh","BB"=>"Barbados","BY"=>"Belarus","BE"=>"Belgium","BZ"=>"Belize","BT"=>"Bhutan","BM"=>"Bermuda","BO"=>"Bolivia","BA"=>"Bosnia Herzegovina","BW"=>"Botswana","BR"=>"Brazil","BN"=>"Brunei","BG"=>"Bulgaria","BF"=>"Burkina Faso","BI"=>"Burundi","KH"=>"Cambodia","CM"=>"Cameroon","CA"=>"Canada","CV"=>"Cape Verde Islands","KY"=>"Cayman Islands","CF"=>"Central African Republic","CL"=>"Chile","CN"=>"China","CO"=>"Colombia","KM"=>"Comoros","CG"=>"Congo","CK"=>"Cook Islands","CR"=>"Costa Rica","HR"=>"Croatia","CU"=>"Cuba","CY"=>"Cyprus North","CZ"=>"Czech Republic","DK"=>"Denmark","DJ"=>"Djibouti","DM"=>"Dominica","DO"=>"Dominican Republic","EC"=>"Ecuador","EG"=>"Egypt","SV"=>"El Salvador","GQ"=>"Equatorial Guinea","ER"=>"Eritrea","EE"=>"Estonia","ET"=>"Ethiopia","FK"=>"Falkland Islands","FO"=>"Faroe Islands","FJ"=>"Fiji","FI"=>"Finland","FR"=>"France","GF"=>"French Guiana","PF"=>"French Polynesia","GA"=>"Gabon","GM"=>"Gambia","GE"=>"Georgia","DE"=>"Germany","GH"=>"Ghana","GI"=>"Gibraltar","GR"=>"Greece","GL"=>"Greenland","GD"=>"Grenada","GP"=>"Guadeloupe","GU"=>"Guam","GT"=>"Guatemala","GN"=>"Guinea","GW"=>"Guinea - Bissau","GY"=>"Guyana","HT"=>"Haiti","HN"=>"Honduras","HK"=>"Hong Kong","HU"=>"Hungary","IS"=>"Iceland","IN"=>"India","ID"=>"Indonesia","IR"=>"Iran","IQ"=>"Iraq","IE"=>"Ireland","IL"=>"Israel","IT"=>"Italy","JM"=>"Jamaica","JP"=>"Japan","JO"=>"Jordan","KZ"=>"Kazakhstan","KE"=>"Kenya","KI"=>"Kiribati","KP"=>"Korea North","KR"=>"Korea South","KW"=>"Kuwait","KG"=>"Kyrgyzstan","LA"=>"Laos","LV"=>"Latvia","LB"=>"Lebanon","LS"=>"Lesotho","LR"=>"Liberia","LY"=>"Libya","LI"=>"Liechtenstein","LT"=>"Lithuania","LU"=>"Luxembourg","MO"=>"Macao","MK"=>"Macedonia","MG"=>"Madagascar","MW"=>"Malawi","MY"=>"Malaysia","MV"=>"Maldives","ML"=>"Mali","MT"=>"Malta","MH"=>"Marshall Islands","MQ"=>"Martinique","MR"=>"Mauritania","YT"=>"Mayotte","MX"=>"Mexico","FM"=>"Micronesia","MD"=>"Moldova","MC"=>"Monaco","MN"=>"Mongolia","MS"=>"Montserrat","MA"=>"Morocco","MZ"=>"Mozambique","NA"=>"Namibia","NR"=>"Nauru","NP"=>"Nepal","NL"=>"Netherlands","NC"=>"New Caledonia","NZ"=>"New Zealand","NI"=>"Nicaragua","NE"=>"Niger","NG"=>"Nigeria","NU"=>"Niue","NF"=>"Norfolk Islands","NO"=>"Norway","OM"=>"Oman","PW"=>"Palau","PA"=>"Panama","PG"=>"Papua New Guinea","PY"=>"Paraguay","PE"=>"Peru","PH"=>"Philippines","PL"=>"Poland","PT"=>"Portugal","PR"=>"Puerto Rico","QA"=>"Qatar","RE"=>"Reunion","RO"=>"Romania","RU"=>"Russia","RW"=>"Rwanda","SM"=>"San Marino","ST"=>"Sao Tome &amp; Principe","SA"=>"Saudi Arabia","SN"=>"Senegal","CS"=>"Serbia","SC"=>"Seychelles","SL"=>"Sierra Leone","SG"=>"Singapore","SK"=>"Slovak Republic","SB"=>"Solomon Islands","SO"=>"Somalia","ZA"=>"South Africa","ES"=>"Spain","LK"=>"Sri Lanka","SH"=>"St. Helena","KN"=>"St. Kitts","SD"=>"Sudan","SR"=>"Suriname","SZ"=>"Swaziland","SE"=>"Sweden","CH"=>"Switzerland","SI"=>"Syria","TW"=>"Taiwan","TJ"=>"Tajikstan","TH"=>"Thailand","TO"=>"Tonga","TT"=>"Trinidad &amp; Tobago","TN"=>"Tunisia","TR"=>"Turkey","TM"=>"Turkmenistan","TC"=>"Turks &amp; Caicos Islands","TV"=>"Tuvalu","UG"=>"Uganda","UA"=>"Ukraine","AE"=>"United Arab Emirates","UY"=>"Uruguay","UZ"=>"Uzbekistan","VU"=>"Vanuatu","VA"=>"Vatican City","VE"=>"Venezuela","VN"=>"Vietnam","VG"=>"Virgin Islands - British","VI"=>"Virgin Islands - US","WF"=>"Wallis &amp; Futuna","YE"=>"Yemen (North)","ZM"=>"Zambia","ZW"=>"Zimbabwe"}
              ############################################### FIN DU TABLEAU DES PAYS #####################################

        @last50pays = Annonce.select('DISTINCT ville,created_at').where('ville!="null"').order(:created_at).limit(50) # Pour la liste des pays au pied de page
        ####################################### CREER UN TITRE UNIQUE POUR CHAQUE PAGE #####################################
           if params[:action] =='index' || params[:action] =='new' || params[:action] =='show'
               if params[:controller] == 'messages' || params[:controller] == 'publictchats'
                  @pagetitle = 'RENCONTRE'
              else
                  @pagetitle = params[:controller].gsub("devise/", " ").gsub("/sessions", " ").gsub('contacts','nous contacter').upcase
              end
           else
               @pagetitle = params[:action].gsub('commentcamarche','comment ça marche').gsub('quisommesnous','qui sommes nous').upcase
           end
           ####################################### FIN CREATION TITRE UNIQUE POUR CHAQUE PAGE #####################################
           if params[:end].nil?
                params[:end] = 9
          @end = 9
     else
          @end = params[:end]
         end

         if params[:start].nil?
                params[:start]=0
          @start =  0
     else
         @start =  params[:start]
         end


  ############################# POUR LE CHAT ##########################

  users_= User.select(:id,:username).where(online: 1).order("created_at DESC")
  @users_online = []
  i=0
   for user_ in users_
      if !Photo.find_by(role:"profil_pic",user_id: user_.id).nil?
          profil_pic = Photo.find_by(role:"profil_pic",user_id: user_.id).name
     else
         profil_pic = "/img/Inscrit_avatar.png"
     end
       tableau = [user_.id,user_.username,profil_pic]
       @users_online.push(tableau)
       i = i+1
   end

  ############################# FIN DU CHAT ##############################

    end


    def after_sign_in_path_for(resource)
      if resource.is_a?(User)
        monprofil_path
      elsif resource.is_a?(Administrateur)
          admin_homes_path
      end
    end


  end
