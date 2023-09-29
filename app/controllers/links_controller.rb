# frozen_string_literal: true

# links controller
class LinksController < ApplicationController
  def create
    @link = Link.new(link_params)

    @link.lookup_code = ShortenerHelper::Shortener.new(link_params['original_url']).lookup_code
    link = Link.find_by(original_url: link_params['original_url'])

    respond_to do |format|
      if @link.valid_url == false
        flash[:alert] = ['Invalid URL']
        format.html { render 'home/index', status: :unprocessable_entity }
      elsif link.present? || @link.save
        flash[:notice] = 'Link Generated'
        flash[:lookup_code] = link.present? ? link.lookup_code : @link.lookup_code
        format.html { redirect_to root_url }
      else
        flash[:alert] = @link.errors.full_messages
        format.html { render 'home/index', status: :unprocessable_entity }
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end
