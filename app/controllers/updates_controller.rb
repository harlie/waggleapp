class UpdatesController < ApplicationController
  # GET /updates
  # GET /updates.json
  def index
    @updates = Update.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @updates }
    end
  end

  # GET /updates/1
  # GET /updates/1.json
  def show
    @update = Update.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @update }
    end
  end

  # GET /updates/new
  # GET /updates/new.json
  def new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @update }
    end
  end

  # GET /updates/1/edit
  def edit
    @update = Update.find(params[:id])
  end

  # POST /updates
  # POST /updates.json
  def create
    @pet = Pet.find(params[:pet_id])
    @update = @pet.updates.build(params[:update])
    @update.name = current_user.name
    @update.poster = current_user
    @user = @pet.user
    
    respond_to do |format|
      if @update.save
        UpdateMailer.update_email( @user, @update.note).deliver
        format.html { redirect_to @pet, notice: 'Update was successfully created.' }
        format.json { render json: @pet, status: :created, location: @pet }
      else
        format.html { render action: "new" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /updates/1
  # PUT /updates/1.json
  def update
    @update = Update.find(params[:id])

    respond_to do |format|
      if @update.update_attributes(params[:update])
        format.html { redirect_to @update, notice: 'Update was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to updates_url }
      format.json { head :ok }
    end
  end
end
