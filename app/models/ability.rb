class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #user ||= User.new # guest user (not logged in)
    #
    # if user.rol.nombre == 'admin'
    #   can :manage, :all
    # elsif user.rol.nombre == 'secretaria patologia'
    #   can :manage, Paciente
    #   can :manage, FormCancerUterino #form anatomia patologica
    #   can :manage, Diagnostico
    #
    # elsif user.rol.nombre == 'secretaria citologia'
    #   can :manage, Paciente
    #   can :manage, FormAnatCitologica
    #   can :manage, FormLiquido
    #   can :manage, BiopsiasForm
    #   can :manage, Diagnostico
    #
    # elsif user.rol.nombre == 'secretaria vigilancia epidemolica'
    #   can :manage, Paciente
    #   can :manage, FormChaga
    #   can :manage, FormMalarium
    #   can :manage, FormLeishmaniasis
    #   can :manage, Diagnostico
    #   can :manage, FormCultivo
    #   can :manage, FormTuberculosis
    #
    # elsif user.rol.nombre == 'encargada inventarios'
    #   can :manage, InsumoReactivo
    #   can :manage, RegistroInsumosReactivo
    #
    # else
    #   can :manage, User
    #   #can :read, :all
    #   #can :manage, User
    # end


    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
