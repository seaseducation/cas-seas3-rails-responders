class Api::BaseController < ApplicationController

  respond_to :json
  #self.responder = Metova::Responder
  self.responder = CasSeas3RailsResponders2::Responder

end