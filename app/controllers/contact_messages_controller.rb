require 'yaml'

class ContactMessagesController < InheritedResources::Base
  before_filter :require_admin, :except => [:new, :create, :show]

  def index
    @contact_messages = ContactMessage.where('id >= 1').order('id desc')
    respond_to do |format|
      format.html
    end
  end

  def create
    @contact_message = ContactMessage.new(params[:contact_message])

    if verify_recaptcha(:model => @contact_message, :message => "Oh! It's error with reCAPTCHA!")
      respond_to do |format|
        if @contact_message.save
          @contact_message.deliver_contact_message!
          logger.info "contact message was sent out"
          format.html { redirect_to @contact_message, :notice => 'Contact message was successfully created.' }
          logger.info "redirected"
          format.json { render :json => @contact_message, :status => :created, :location => @contact_message }
        else
          format.html { render :action => "new" }
          format.json { render :json => @contact_message.errors, :status => :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
          format.html { render :action => "new" }
          format.json { render :json => @contact_message.errors, :status => :unprocessable_entity }
      end
    end
  end
end
