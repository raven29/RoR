class EmailsController < ApplicationController
  # GET /emails
  # GET /emails.xml
  def index
    @emails_important = Email.find(:all, :conditions=>'important=1 and sent=0 and deleted=0')
	@emails_ordinary  = Email.find(:all, :conditions=>'important=0 and sent=0 and deleted=0')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emails_important + @emails_ordinary }
  end
  end

  # GET /emails/search
  # GET /emails/search.xml
  def search
    @emails_found = []
    @subj = params[:subj].strip if params[:subj]
	@emails_found = Email.find(:all, :conditions=>["deleted=0 and subject like ?", "%#{@subj}%"]) if @subj
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emails_found }
    end
  end
  
  
  # GET /emails/sent
  # GET /emails/sent.xml
  def sent
    @emails_sent = Email.find(:all, :conditions=>'sent=1 and deleted=0')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emails_sent }
    end
  end

  # GET /emails/trash
  # GET /emails/trash.xml
  def trash
    @emails_trash = Email.find(:all, :conditions=>'deleted=1')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emails_sent }
    end
  end
  
  
  # GET /emails/drafts
  # GET /emails/drafts.xml
  def drafts
    @emails_important = Email.find(:all, :conditions=>'important=1 and sent=0 and deleted=0')
	@emails_ordinary  = Email.find(:all, :conditions=>'important=0 and sent=0 and deleted=0')
    #self.index
	render :template=>'emails/_drafts'
  end

  
  # GET /emails/1
  # GET /emails/1.xml
  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email }
    end
  end

  # GET /emails/new
  # GET /emails/new.xml
  def new
    @email = Email.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email }
    end
  end

  # GET /emails/1/edit
  def edit
    @email = Email.find(params[:id])
  end

  # POST /emails
  # POST /emails.xml
  def create
    @email = Email.new(params[:email])

    respond_to do |format|
      if @email.save
        flash[:notice] = 'Email was successfully created.'
        format.html { redirect_to(@email) }
        format.xml  { render :xml => @email, :status => :created, :location => @email }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emails/1
  # PUT /emails/1.xml
  def update
    @email = Email.find(params[:id])

    respond_to do |format|
      if @email.update_attributes(params[:email])
        flash[:notice] = 'Email was successfully updated.'
        format.html { redirect_to(@email) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.xml
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
  end
  
  # PUT /emails/delete/1
  def delete
    #@email = Email.find(params[:id])
    Email.update params[:id], :deleted => 1
  end
  
  # PUT /emails/restore/1
  def restore
    #@email = Email.find(params[:id])
    Email.update params[:id], :deleted => 0
  end

  # PUT /emails/send/1
  # WARNING! This is only a stub!
  #Real method depends on server realization and some other parameters!!!
  #
  def send_message
    #@email = Email.find(params[:id])
    Email.update params[:id], :sent => 1
  end
  
end
