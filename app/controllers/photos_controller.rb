class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
       @photo = Photo.find(params[:id])
  end

  # POST /photos
  # POST /photos.json
  def create
         @name = Time.now.strftime("%Y%d%M%H%M%s")
         uploaded_io = params[:photo][:photo]
      @extention = uploaded_io.original_filename[uploaded_io.original_filename.length-3.to_i..100].to_s
     @photo = Photo.new(role: params[:photo][:role], name:  @name+'.'+@extention, user_id: current_user.id)
if @extention =="png" || @extention =="PNG" || @extention =="jpg" || @extention =="JPG"  || @extention =="gif"  || @extention =="GIF"
     respond_to do |format|

      if photo=@photo.save

        File.open(Rails.root.join('public', 'uploads/', @name+'.'+@extention), 'wb') do |file|
        file.write(uploaded_io.read)
        end

        format.html { redirect_to "/monprofil/", notice: 'Photo was successfully created. file size = '+uploaded_io.size.to_s+' octs'  }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
else
    redirect_to "/monprofil/", alert:  @extention+' Seul les images PNG,JPG ou GIF sont autorisées !'
end

  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update

         @photo = Photo.find_by(user_id: current_user.id, role: params[:photo][:role])
         @name = Time.now.strftime("%Y%d%M%H%M%s")
         uploaded_io = params[:photo][:photo]
      @extention = uploaded_io.original_filename[uploaded_io.original_filename.length-3.to_i..100].to_s

if @extention =="png" || @extention =="PNG" || @extention =="jpg" || @extention =="JPG"  || @extention =="gif"  || @extention =="GIF"

    respond_to do |format|
      if @photo.update(name: @photo.name, user_id: current_user.id)

        File.open(Rails.root.join('public', 'uploads/', @photo.name), 'wb') do |file|
        file.write(uploaded_io.read)
        end
        format.html { redirect_to "/monprofil/", notice: 'Photo was successfully updated. file size = '+uploaded_io.size.to_s+' octs'  }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_photo }
      end
    end


  else
      redirect_to "/monprofil/", alert:  @extention+' Seul les images PNG,JPG ou GIF sont autorisées !'
  end

  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      #params.require(:photo).permit(:role, :name, :user_id)
      @name = Time.now.strftime("%Y%d%M%H%M%s")
    end
end
