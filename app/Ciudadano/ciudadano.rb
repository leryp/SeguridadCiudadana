# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Ciudadano
  include Rhom::PropertyBag

  belongs_to :sector_id, 'Sector'
  # Uncomment the following line to enable sync with Ciudadano.
  #enable :sync

  #add model specific code here
  
end
