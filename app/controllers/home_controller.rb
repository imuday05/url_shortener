class HomeController < ApplicationController
  def index
    @link = Link.new
  end

  def redirect_lookup
    lookup_code = params[:lookup_code]
    link = Link.find_by(lookup_code: lookup_code)

    respond_to do |format|
      if link.present?
        format.html { redirect_to link.original_url, allow_other_host: true }
      else
        flash[:alert] = 'Link not Found'
        format.html { redirect_to root_path }
      end
    end
  end
end
